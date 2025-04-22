use std::{fs, io::{self, Write}};

use clap::{command, Arg, Command, Parser, Subcommand};
mod error;
pub use {error::Result,error::CliError};

#[derive(Parser)]
#[command(version, about = "Internal tooling")]
struct Cli{
	#[command(subcommand)]
	command: Commands
}

#[derive(Subcommand,Debug)]
enum Commands{
	/// Database controls
	Db{
		#[command(subcommand)]
		command: DbCommands
	}
}

#[derive(Subcommand,Debug)]
enum DbCommands{
	/// Setup and edit the database
	Setup{
		#[arg(short,long)]
		database_url: Option<String>,
		#[arg(short,long)]
		source: Option<String>,
	},
	/// Create data in the database
	Create
}

fn main() -> Result<()> {
	let _ = dotenv::dotenv();
	let cli = Cli::parse();
	match &cli.command {
		Commands::Db { command } => {
			match command {
				DbCommands::Setup { database_url,source } => 
					setup_database(database_url,source)?,
				DbCommands::Create => {

				}
			}
		}
	}
	Ok(())
}

fn setup_database(database_url: &Option<String>,source: &Option<String>) -> Result<()>{
	let database_url = match database_url {
		Some(url) => url.clone(),
		None => {
			let url = std::env::var("DATABASE_URL")
				.expect("Database url not set");
			url
		}
	};

	let migrations_dir = match source {
		Some(dir) => dir,
		None => "migrations"
	};
	
	// Check if the migrations folder exists
	fs::read_dir(migrations_dir)?;

	let output = std::process::Command::new("sqlx")
		.arg("--version")
		.output()?;

	if !output.status.success(){
		eprintln!("sqlx-cli not installed")
	}

	let output = std::process::Command::new("sqlx")
		.args([
			"database",
			"create",
			"--database-url",
			&database_url,
		])
		.output()?;

	io::stdout().write_all(&output.stdout)?;
	if !output.status.success(){
		io::stderr().write_all(&output.stderr)?;
		return Err(CliError::execution_failed("Failed to create database"))
	}
	
	let output = std::process::Command::new("sqlx")
		.args([
			"migrate",
			"run",
			"--database-url",
			&database_url,
			"--source",
			migrations_dir
		])
		.output()?;
	
	io::stdout().write_all(&output.stdout)?;
	if !output.status.success(){
		io::stderr().write_all(&output.stderr)?;
		return Err(CliError::execution_failed("Failed to run migrations"))
	}

	Ok(())
}

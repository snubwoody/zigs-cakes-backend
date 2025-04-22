WITH new_user AS (
	INSERT INTO users(id) 
	VALUES(uuid_generate_v4()) 
	RETURNING id
),
role_id AS (
	SELECT id FROM roles 
	WHERE label = 'admin'
)
INSERT INTO user_roles(uid,role)
SELECT new_user.id, role_id.id
FROM new_user,role_id;
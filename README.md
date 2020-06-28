Simple app with quizes. Back-end is made with ruby on rails 6, front-end is made with vuejs.

### API:

In order to make any request except signup and signin you need to send JWT token. You can get it by signing in. Then, in your request, set header "Authorization" to "Bearer *your token*". Otherwise you'll get status 401 in response.

| URL | Type | Request body | Response | Description |
| --- | --- | --- | --- | --- |
| /api/v1/signup | POST | {"user": {"name": *string*, "password": *string*, "password_confirmation": *string*}} | {} | URL to signup. All params are required. Returns empty json on success |
| /api/v1/signin | POST | {"auth": {"name": *string*, "password": *string*}} | { "jwt": *jwt_token* } | URL to signin. All params are required. Returns jwt token on success, status 404 when user is not found. |
| /api/v1/categories | GET | *empty* | [{"id": *integer*, "title": *string*}] | Returns array with ids and titles of all quiz categories |
| /api/v1/categories | POST | {"category": {"title": *string*}} | *empty* or {"error": { *param*: [ *errors* ]} | Creating category. All params are required. Returns empty json on success, or json with errors assigned to each attribute when wrong attributes are given |
| /api/v1/categories/:id | GET | *empty* | {"category": {"title": *string*}, "questions": [{"id": *integer*, "content": *string*, "answers": *array of 4 strings*, "correct_answer": *string*}]} | Returns title of category and questions belonging to this category |
| /api/v1/categories/:id | PATCH, PUT | {"category": {"title": *string*}} | {} | Updates category with id given in URL. All params are required. Returns empty json on success |
| /api/v1/categories/:id | DELETE | *empty* | {} | Deletes category with id given in URL. Returns empty json on success |
| /api/v1/categories/:category_id/questions | GET | *empty* | {"questions": [{"id": *integer*, "content": *string*, "answers": *array of 4 strings*, "correct_answer": *string*}]} | Returns json with questions belonging to category with id given in URL | 
| /api/v1/categories/:category_id/questions | POST | {"question": {"content": *string*, "answers": *array of 4 strings*, "correct_answer": *string*}} | {} | Creates question belonging to category with id given in URL. All params are required. Returns empty json on success | 
| /api/v1/questions/:id | PATCH, PUT | {"question": { "content": *string*, "answers": *array of 4 strings*, "correct_answer": *string*}} | {} | Updates question with id given in URL. All params are required. Returns empty json on success |
| /api/v1/questions/:id | DELETE | *empty* | {} | Deletes question with id given in URL. Returns empty json on success |
| /api/v1/categories/:category_id/get_questions | GET | *empty* | {"questions": [{"id": *integer*, "content": *string*, "answers": *array of 4 strings*}]} | Gets 5 random questions from category with id given in URL. Doesn't return correct answer |
| /api/v1/questions/:id/answer | POST | {"answer": *string*} | {"is_correct": boolean} | Answer to question with id given in URL. |

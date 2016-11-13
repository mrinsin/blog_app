This app follows the following stories::


As an internet user, I can go to our website and register with full name, email and password, and be taken to a page showing a registration success message and my information.


As a registered user, I can to go our website and log in with email and password, and be taken to a Welcome Back page showing my full name.
Hint: Being logged in and logging out depends on having a cookie with the user’s id. Put the user’s ID in a cookie called user_id; then later you can get access to the logged in user with User.find(cookies[:user_id])


As a logged in user, I can create a blog post with title and message on the Welcome Back page.
Hint: Put a form on the Welcome Back page to submit a blog post. What URL, controller method and view are you going to use?
Hint: Create a new model that references the user.


As a logged in user, can see all my blog posts with title on the Welcome Back page.


**Still in progress**
As a logged in user, when I click on a blog title on the Welcome Back page, I am taken to a page showing the blog title and message.
Hint: The link for each blog post should be /show_blog?id=1 (according to the unique key (ID) of the post). What controller, method and view are you going to use?
Hint: Implement the show blog page before implementing list on the Welcome Back page.


As a registered user, I can to go our website and log in, and be taking to a page where I can see a log out button, which when I click on it logs me out.
Hint: Being logged in and logging out depends on having a cookie with the user’s id.

**Still in progress**
As a logged in user, if I go to the registration page, I will get to see the Welcome Back page.

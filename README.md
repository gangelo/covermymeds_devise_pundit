# README

## TODO

Sanitize search criteria for user search!

Finish up Pundit policies

Finish up specs

Handle error logging better at the controller level, for example
:not_found?

Don't actually delete user accounts, but add deleted switch to the users table.

Code to "showModalDialog" could be DRYed up; lots of common code there.

Internationalize javascript text, for example, modal dialog text.

Remove javascript alerts for delete options for users and replace with jquery modal dialog.

Change Devise confirmation email mailer wording when updating an email for a user that already exists. Currently, it uses the "Welcome" verbiage: /views/devise/mailers/confirmation_instructions.html.erb

## For Later

### Internationalization/localization
#### Guides
* http://guides.rubyonrails.org/i18n.html
* http://guides.rubyonrails.org/i18n.html#footnote-1

* https://phraseapp.com/blog/posts/rails-i18n-guide/
* https://phraseapp.com/blog/posts/rails-i18n-best-practices/

## Devise
* Change default routes created by Devise for sessions controller (e.g.
new_session_path => sign_in_path, destroy_user_session_path => log_out_path)

## Miscellaneous
* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Sessions/Login Lab

## Introduction

We've seen how to encrypt data and how to set, delete and use cookies for a given a client, whether logged-in or not. Let's practice this by creating a photo-sharring app, Flickr.

## Before Start

Before we start, we need to install Bootstrap in rails. Follow the instructions.

1. Add gems into `Gemfile`

  ``` ruby
  gem 'bootstrap-sass'
  gem 'sass-rails'
  ```

1. run `bundle install`
1. in `app/assets/stylesheets/` change `application.css` to `application.scss`. From now on, in `app/assets/stylesheets/`, all your `.css`  should be changed to the extension `.scss`
1. in `app/assets/stylesheets/application.scss` import Bootstrap styles

  ``` css
  // "bootstrap-sprockets" must be imported before "bootstrap" and "bootstrap/variables"
  @import "bootstrap-sprockets";
  @import "bootstrap";
  ```

1. in `app/assets/javascripts/application.js` add

  ``` js
  //= require jquery
  //= require bootstrap
  ```

## Using bootstrap with `form_for`
To add classe/id to while using `form_for`, you can pass in a key `html:` that has a value `{ class: "edit_post", id: "edit_post_form" }`

```html
<%= form_for @post, {url: post_path(@post), method: :patch, html: {class: "edit_post", id: "edit_post_form"}} do |f| %>
  ...
<% end %>
```

## Using SCSS
By using `gem 'sass-rails'`, you can now use the super amazing SCSS instead of CSS. The difference is that you can nest css code inside another css code when such the following

In CSS you need to...

``` css
div {
  color: black;
}

div > p {
  color: red;
}
```

In SCSS you can...

``` css
div {
  color: black;
  p {
    color: red:
  }
}
```

Amazing right?!!

## Rails SCSS Tip
1. To make your live easier, you should have `.container` or `.container-fluid` wrapping around `<%= yield %>` in `application.html.erb`

  ``` html
  <div class="container">
    <%= yield %>
  </div>
  ```

1. In rails, since we included `*= require_tree .`, it will actually render *ALL* your css to *EVERY* view. Therefore this might increase the chance for css conflicts. A good way to deal with this is to wrap your html views that belongs to the same resource with `<div class="resource-name resource-name-action">your view's code in here</div>`. And in your scss file, wrap everything with `.resource-name { css code here }` for common css shared accross all `posts` and `.resource-name-action { css code here }` for action specific css. Below is an example.

  In `app/views/posts/index.html.erb`

  ``` html
  <div class="posts posts-index">
    <!-- code for index html here -->
  </div>
  ```

  In `app/views/posts/show.html.erb`

  ``` html
  <div class="posts posts-show">
    <!-- code for show html here -->
  </div>
  ```

  In `app/assets/stylesheets/posts.scss`

  ``` css
  .posts {
    /* common posts css here */
  }

  .posts-index {
    /* posts-index specific css here */
  }

  .posts-show {
    /* posts-show specific css here */
  }
  ```

### Requirements

- For Bootstrap
  - Make this app responsive (use `container-fluid`)
  - Add a navbar at the top
  - Style all your pages with with bootstrap (ex. tables and forms)

- For Authentication
  - Create a Flickr Rails app with a user model using bcrypt-ruby that stores encrypted passwords
  - Add a login/signup page
    - The users should be listed on `users/index`
  - Create a resource photos with a title(string) and url(text)
    - Photos should be associated to a user - a photo belongs to a user, a user has many photos
    - Only the logged-in users can add photos
    - A user can only edit and delete the photos he/she owns.
  - The app should have a profile page for every user and the photos added by this user should be listed on the user/show page

**Bonus:**
- Try to add a page to update his own profile.
- Try to add a page to list the pictures for the current user.

### Deliverable

After you've created a user, but you're logged out:

<p align="center">
<img src="http://s30.postimg.org/jcib9ipkx/Screen_Shot_2015_07_19_at_12_53_28_PM.png">
</p>

If you try to create a photo, by clicking on the green "+ New" button, but you're logged out:

<p align="center">
<img src="http://s1.postimg.org/hdi87i8tr/Screen_Shot_2015_07_19_at_12_53_43_PM.png">
</p>

But once you log in:

<p align="center">
<img src="http://s10.postimg.org/fl3npmzrt/Screen_Shot_2015_07_19_at_12_54_04_PM.png">
</p>

### Resources

- Look to the [solution code](https://github.com/wdi-hk-9/lesson-rails-sessions-custom-auth/tree/in-class) from today's lesson to guide you
- [This RailsCast](http://railscasts.com/episodes/250-authentication-from-scratch) on authentication by hand could help, too; note this is an older version!
- [Hartl's tutorial](https://www.railstutorial.org/book/modeling_users) can always help

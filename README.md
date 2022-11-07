# Rails Practice Challenge - Students

## Setup

To download the dependencies for backend, run:

```console
$ bundle install
```

There is some starter code in the `db/seeds.rb` file so that once you've
generated the models, you'll be able to create data to test your application.

You can run your Rails API on [`localhost:3000`](http://localhost:3000) by running:

```console
$ rails s
```

There are no tests for this application, so you'll need to check your progress
by running the server and using Postman make requests.

## Introduction

We're going to build an API for an instructor to manage their students. Create
the following database structure. You will have two models (and their
corresponding tables), `Student` and `Instructor`, with the following
relationships:

- An instructor has many students
- A student belongs to an instructor

The models should have the following attributes (along with any attributes
needed to create the relationships defined above):

- Instructor
  - name (must be present)
- Student
  - name (must be present)
  - major
  - age (must be >= 18)

Make sure to define validations for your models so that no bad data can be saved
to the database.

## Deliverables

As a user, I can:

- Create, read, update and delete **Instructors**
- Create, read, update and delete **Students**
  - When creating or updating a student, they must be associated with an
    instructor

Follow good API design practices and use RESTful routing conventions. Make sure
to handle errors and invalid data by returning the appropriate status code along
with a message.

## Instructions

- Time yourself while working on the deliverables
- Commit when you hit 75 minutes
- When you have finished all deliverables, commit again.

STEPS TO TAKE TO COMPLETE THIS LAB:

_ Also check if serialzier gem is installed in the gem files.

- Check what data is given and what we need to find, seeds is given. (Within the seeds file, there is a specific Instructor_id that needs to be present in the migration file of the CreateStudents. t.integer :instructor_id).

- Creating database structure for both Student and Instructor by using rails g resource Instructor name --no-test-framework.

- Same for Student: rails g resource Student name major age:integer --no-test-framework. (Because we checked the given data first with the seeds file, we can assume that one more column is needed in the CreateStudents migration table, t.integer :instructor_id going back to step 2).

- Now we can run rails db:migrate db:seed for all migrations of all things. *Reminder when you run rails g resource (example) attributes, etc.. you are also creating a controller, a model, a migration table and within your routes resources for each given creation.

- Open up rails c to see if all data is correctly placed. ex. Student.all or Instructor.all.

- Then after seeing data, set up relationships in our models. (Ex in this case. Student belongs_to :instructor and Instructor has_many : students).

- After this go back into rails c and see if relationships are set up correctly to return the proper data (Ex. Student.first.instructor) if it returns the instance true of something then our models and relationships set up correctly.

- The models should have the following attributes (along with any attributes needed to create the relationships defined above) NOW, Make sure to define validations for your models so that no bad data can be saved to the database. 

- Go into instructor model and use validataion. (Ex. validates :name, presence :true).

- Go to student model and use the same validation for name just as we did in instructor, IF the given information asks "name (must be present)" we must provide that the presence is true. Anything with a "MUST" most likely will have some sort of validation. This example is asking for "age (must be >= 18)" so we can look into Active Record Validations for rails guide to find the right validation for this example. When you look at the numericality section, you will find lots of methods that we can use but we look for the one the example is asking for, in this case (>=18); greater_than_or_equal_to make sure you follow examples syntax as well! (Ex. validates :age, numericality: { greater_than_or_equal_to: 18 }).

- At this point you can check to see if all the data is rendering, not in POSTMAN but we can check in the terminal with rails c. (Ex. Instructor.create(name: "Shree")) if your data shows and is accepted then you are good to go. (Ex. Student.create(name "Emily", age: 19, instructor_id: 5)). All validations are done and we can continue on to our delieverables.

 Delieverables:

 - Before we begin, go back to routes file and add 'only: [:index, :show, :create, :update, :destroy]' because the deliverables are asking for FULL CRUD we need to start setting up our routes to be able to send these requests. Create an 'only' for each resource, or however many routes of CRUD the README is asking for. 

- First we can start at the StudentsController by creating our methods to get our actions. Our first controller action will be (Ex. def index (GET), def show, def create (POST), def update (PATCH), destroy (DELETE).) They all should render json: and send a status of ok or crated or a numerical status like ex. status: 200.

- We should create some strong params when doing a POST for a student. 

- The last steps to finish this lab should be the custom error messages. 
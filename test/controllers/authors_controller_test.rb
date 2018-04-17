require "test_helper"
require 'pry'

describe AuthorsController do
  it "should get index" do
    # Arrange

    # Act
    get authors_path

    # Assert
    must_respond_with :success
  end

  describe "edit" do
    it "should successfully get to an edit page for an author that exists" do

      get edit_author_path authors(:metz).id

      must_respond_with :success
    end

    it "should redirect to the home page when going to the edit page of an author that does not exist" do

      get edit_author_path 'foo'

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  describe "create" do

    it "successfully creates an author with valid data" do

      proc {
        post authors_path, params: {
          author: {
            name: "New Author"
          }
        }
      }.must_change 'Author.count', 1

      must_respond_with :redirect
      must_redirect_to authors_path
    end

  end

  describe "update" do

    it "updates an Author's name when given a valid name and valid author" do
      # Arrange
      updated_name = "deeface"


      # Act
      put author_path authors(:dee).id , params: {
        author: {
          name: updated_name
        }
      }

      updated_author = Author.find(authors(:dee).id)

      updated_author.name.must_equal updated_name

      must_respond_with :redirect
    end

  end



end

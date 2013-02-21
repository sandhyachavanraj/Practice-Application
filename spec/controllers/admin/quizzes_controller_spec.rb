require 'spec_helper'

describe Admin::QuizzesController do
	login_admin

	describe "Get New" do

		it "should return new quiz" do
			get :new
			assigns[:quiz].should be_a_new(Quiz)
		end		
	end
	
	describe "Get Index" do
		before do
			@quiz = FactoryGirl.create(:quiz)
		end

		it "should display list of quizzes" do
			get :index
			assigns[:quizzes].first.should eql(@quiz)
		end
	end

	describe "Get Create" do
		before(:each) do
			@user = FactoryGirl.create(:admin)
			controller.stub(:current_user).and_return(@user)
			@quiz = FactoryGirl.attributes_for(:quiz)
		end

		it "should create a new quiz" do
			post :create, @quiz
			assigns[:quiz].should_not be_new_record
		end

		it "should set a flash[:notice]" do
      post :create, @quiz
      flash[:notice].should  include("Successfully Created New Quiz")
    end

    it "should redirect to the admin dashboards" do
      post :create, @quiz
      response.should redirect_to(admin_dashboards_path)
    end

    context "when record fails to save" do
    	before(:each) do
      	@quiz = mock_model(Quiz, :save => nil)
    		Quiz.stub(:new).and_return @quiz
    	end
    	
    	it "should render the new template"	 do
    		@quiz.stub(:save).and_return false
				post :create, :id => @quiz.id
				response.should render_template("new")
			end
		end
	end

	describe "Put Edit" do
		before do
			@quiz = FactoryGirl.create(:quiz)
		end

		it "should edit quiz" do
			get :edit, :id => @quiz.id
			assigns[:quiz].should eql(@quiz)
		end
	end

	describe "Put Update" do
		before(:each) do
			@quiz = FactoryGirl.create(:quiz)
		end

		it "should update the quiz record" do
			put :update, :id => @quiz, :quiz =>  FactoryGirl.attributes_for(:quiz)
      assigns(:quiz).should eql(@quiz)
		end

		it "should redirect to the admin dashboards" do
      put :update, :id => @quiz
      response.should redirect_to(admin_quizzes_path)
    end

    it "should set a flash[:notice]" do
      put :update, :id  => @quiz
      flash[:notice].should == "Quiz is Updated Successfully"
    end

    context "when the quiz fails to save" do
    	before(:each) do
    		@quiz = FactoryGirl.create(:quiz)
    	end

    	it "should render the edit template"	 do
      	Quiz.any_instance.stub(:save).and_return(false)
				put :update, :id => @quiz.id
				response.should render_template("edit")
			end
    end
	end
end
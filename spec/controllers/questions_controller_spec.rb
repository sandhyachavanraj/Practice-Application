require 'spec_helper'

describe QuestionsController do
	login_user

	describe "Get new" do
		before do
			 @quiz = FactoryGirl.create(:quiz)
			 @radio_question = FactoryGirl.create(:question, :quiz_id => @quiz.id,:input_type => "Radio")
			 @list_question = FactoryGirl.create(:question, :quiz_id => @quiz.id,:input_type => "Listbox")
			 @checkbox_question = FactoryGirl.create(:question, :quiz_id => @quiz.id,:input_type => "Checkbox")
			 @questions = Question.where(:quiz_id => @quiz.id)
		end
    
		it "should return new question" do
			get :new, :quiz_id => @quiz.id
			assigns[:question].should be_a_new(Question)
		end

		it "should be quiz" do
			get :new, :quiz_id => @quiz.id
			assigns[:quiz].id.should == @quiz.id
		end
		it "checking array of quiz questions" do
			get :new, :quiz_id => @quiz.id
			assigns[:questions].first.should eql(@questions.first)
		end

		it "passing Radio as input type" do
			@radio_options = FactoryGirl.create(:option,:question_id => @radio_question.id)
	  	get :new, :quiz_id => @quiz.id
			assigns[:values].first.should eql "female"
		end

		it "passing Listbox as input type" do
			@listbox_options = FactoryGirl.create(:option, :question_id => @list_question.id,:value => "Ruby")
			get :new, :quiz_id => @quiz.id
			assigns[:listvalues].first.should eql "Ruby"
		end

		it "passing Checkbox as input" do
			@checkbox_options = FactoryGirl.create(:option, :question_id => @checkbox_question.id, :value => "chess")
			get :new, :quiz_id => @quiz.id
			assigns[:check_values].first.should eql "chess"
		end
	end

	describe "Get Index" do
		before do
			@quiz = FactoryGirl.create(:quiz)
			@questions = Question.where(:quiz_id => @quiz.id)
		end

		it "dispaly question and answers" do
			get :index, :quiz_id => @quiz.id
			assigns[:questions].first.should eql(@questions.first)
		end

		it "should render the index template"	 do
			get "index", :quiz_id => @quiz.id
			response.should render_template("index")
		end
	end

	describe "Get Create" do
		
		before(:each) do
			@quiz = FactoryGirl.create(:quiz)
			@user = FactoryGirl.create(:user)
			controller.stub(:current_user).and_return(@user)
			@quiz_user = FactoryGirl.create(:quiz_user,:quiz_id => @quiz.id, :user_id => @user.id)
			@questions = FactoryGirl.create_list(:question, 3, :quiz_id => @quiz.id)
			post :create, :quiz_id => @quiz.id, :question => {"6"=>{"question_id"=>"6", "answer"=>"male"}}
			@q = controller.params[:question]
			@answer = FactoryGirl.create(:answer, :question_id => @q["6"]["question_id"], :quiz_user_id => @quiz_user.id)
			@msg = []
		end

		it "should be a new question" do
			post :create, :quiz_id => @quiz.id
			assigns[:question].should be_a_new(Question)
		end

		it "should display a quiz" do
			post :create, :quiz_id => @quiz.id
			assigns[:quiz].should eql(@quiz)
		end

		it "should display list of questions" do
			post :create, :quiz_id => @quiz.id
			assigns[:questions].first.id.should eql(@questions.first.id)
		end

	  it "should save the answers" do
	  	post :create, :quiz_id => @quiz.id
		 	assigns[:a].should_not be_a_new(Answer)
	  end

		it "should set a flash[:notice] post" do
      post :create, :quiz_id => @quiz.id
      flash[:notice].should == "Values are saved...!!!"
    end

		it "should redirect to the posts index" do
      post :create, :quiz_id => @quiz.id
      response.should redirect_to(dashboards_path)
    end

    it "should contains question id" do
    	post :create, :quiz_id => @quiz.id, :question => {"question_id"=>"6", "answer" => "ruby"}
    	assigns[:msg].should be_empty
		end

		context "if question id is not there it should render new template" do
			before(:each) do
			  post :create, :quiz_id => @quiz.id, :question => {"answer" => "ruby"}
				@qsn = controller.params[:question]
			end

			it "should not contain question id" do
				post :create, :quiz_id => @quiz.id
				@qsn.should_not have_key(:question_id)
			end

			it "should render new template" do
				Question.any_instance.stub(:save).and_return(false)
				post :create, :quiz_id => @quiz.id, :question => {'1' => {"question_id" => 1}}
				response.should render_template(:new)
			end
		end

		it "should redirect to dashboards" do
			post :create, :quiz_id => @quiz.id
			response.should redirect_to(dashboards_path)
		end
	end
end
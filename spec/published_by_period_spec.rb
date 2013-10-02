require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe PublishedByPeriod do

  context 'with a DateTime publish attribute' do

    before :all do
      build_model :post do
        string :title
        text :body
        datetime :publish_start, :publish_end
        attr_accessible :title, :body, :publish_start, :publish_end
        validates :body, :title, :presence => true
        extend PublishedByPeriod
        published_by_period
      end
    end

    describe 'publishing and unpublishing' do

      before :each do
        @post = Post.new :title => Faker::Lorem.sentence(4), 
                         :body => Faker::Lorem.paragraphs(3).join("\n")
        @post.should be_valid
        @post.should_not be_in_published_period
      end

      it 'should be published if now is after the publish time' do
        @post.publish_start = DateTime.now - 1.minute
        @post.should be_in_published_period
      end

      it 'should not be published if now is before the publish time' do
        @post.publish_start = DateTime.now + 1.minute
        @post.should_not be_in_published_period
      end

      it 'should have a publish time of now or earlier after publish is directly called' do
        @post.publish_by_period
        @post.should be_in_published_period
        @post.publish_start.should <= DateTime.now
      end

      it 'should be in period after publish with define date start and end.' do
        date_start = DateTime.now - 1.day
        date_end = DateTime.now + 1.day

        @post.publish_by_period date_start, date_end

        @post.publish_start.should == date_start
        @post.publish_end.should == date_end
      end

    end

  end

  describe 'with an invalid configuration' do

    it 'should raise a configuration error when the publish column not defined' do
      expect {
        build_model :post do
          string :title
          text :body
          attr_accessible :title, :body
          validates :body, :title, :presence => true
          extend PublishedByPeriod
          published_by_period
        end
      }.to raise_error ActiveRecord::ConfigurationError
    end

    it 'should raise a configuration error when defined on a missing column' do
      expect {
        build_model :post do
          string :title
          text :body
          datetime :published
          attr_accessible :title, :body, :published
          validates :body, :title, :presence => true
          extend PublishedByPeriod
          published_by_period
        end
      }.to raise_error ActiveRecord::ConfigurationError
    end

  end

end

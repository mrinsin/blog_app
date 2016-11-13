require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'should have a title and a message' do
    blog = Blog.new(title: 'First Post', message: 'This is my very first blog post!')
    @user = User.new(full_name: 'Mrinalini Sinha', email_address: 'mrin@sin.com', password: 'mrinsin')
    @user.save
    blog.user = @user

    expect(blog.save).to eq true

    blog2 = Blog.find_by_title('First Post')
    expect(blog2.message).to eq 'This is my very first blog post!'
  end
end

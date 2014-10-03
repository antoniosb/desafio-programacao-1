describe User do

  context 'validations' do
   it { should validate_presence_of :email } 
   it { should validate_presence_of :password }
   it { should validate_confirmation_of :password }
  end

end

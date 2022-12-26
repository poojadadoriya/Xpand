class ContactSerializer
  include FastJsonapi::ObjectSerializer
  attributes :issue_type, :user
  
   
end
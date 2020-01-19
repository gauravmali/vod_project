user = @shows_service.user
response = @shows_service.response
if user.present?
 json.merge! response
else
  json.status 'failure'
  json.message 'Not a valid user'
end

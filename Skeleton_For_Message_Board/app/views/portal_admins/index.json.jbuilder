json.array!(@portal_admins) do |portal_admin|
  json.extract! portal_admin, :id
  json.url portal_admin_url(portal_admin, format: :json)
end

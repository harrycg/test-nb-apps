require 'nationbuilder'

client = NationBuilder::Client.new('harrycossar', ENV['NATIONBUILDER_APIKEY'], retries: 8)

  puts "Loading donations..."

=begin
 params = {
  tag: "is:%20awesome%20core%202018"
    
}

response = client.call(:people_tags, :people, params)
paginated = NationBuilder::Paginator.new(client, response)
page1 = paginated
page2 = page1.next
page3 = page2.next

 people = paginated.body["results"]

 
people.each do |person|
  
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['id']
  
    puts "#{email} #{first_name} #{last_name} #{id}"

end
=end

filter = {
  tag: "is:%20community%202018"  
}

response = client.call(:people, :index, filter)

paginated = NationBuilder::Paginator.new(client, response)

 people = paginated.body["results"]

 
people.each do |person|
if person['tags'].include? 'is: community 2018'
if person['tags'].include? 'is: awesome core 2018' 
  
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['id']
  
    puts "#{email} #{first_name} #{last_name} #{id}"


=begin
 params = {
 id: "#{id}",
  tagging: {
    tag: "is: awesome core 2018"
  }
  
}
  client.call(:people, :bulk_tag_removal , params)

=end
  
  params2 = {
 id: "#{id}",
  tagging: {
    tag: "test"
  }
  
}
  
  
  client.call(:people, :tag_person , params2)
end
else
people.each do |person|
  
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['id']
  
    puts "#{email} #{first_name} #{last_name} #{id}"

  params3 = {
 id: "#{id}",
  tagging: {
    tag: "yep"
  }
  
}
    client.call(:people, :tag_person , params3)

end

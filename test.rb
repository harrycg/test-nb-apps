require 'nationbuilder'

client = NationBuilder::Client.new('harrycossar', ENV['NATIONBUILDER_APIKEY'], retries: 8)

  puts "Loading donations..."

params= {
tag: "is: community 2018"
  
    
  }

  response = client.call(:people_tags, :people , params)


paginated = NationBuilder::Paginator.new(client, response)
page1 = paginated
page2 = page1.next
page3 = page2.next


  puts "HELLO"


RSpec.configure do |config|
  config.before(:each) do
    
    stub_request(:get, /min-api.cryptocompare.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "BRL": "3.2571"
      }', headers: {})
  end
end

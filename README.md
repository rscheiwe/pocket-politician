# Pocket Politician
### *The Politician in Your Pocket* 

*Pocket Politician* is a CLI game where you attempt to bribe members of the US Congress in order to get them to pass legislation on your behalf. You can play as a party member from your state or choose another state to satisfy your curiosity. Members of the opposing party know about your deceptions, so watch out and don't choose any opposition parties because they'll steal your money. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

*Pocket Politician* is written in Ruby, so your environment must have the language. 

### Installing

Fork and clone the repository to your system. Currently, the `database` is seeded with representatives as of 2018, so it is ready to run out of the box. Simply run

`ruby run.rb`

in your CLI, and play along. 

*Pocket Politician* uses the OpenSecrets `getLegislators` API to retrieve politician data from their database. (See Built With below for more information.) If you wish to reseed the `database`, follow these instructions.

1. run `ruby seed.rb` 

   The `seed.rb` file has a working list of the states, `state_arr`. This may be altered with the relevant `id` requirements outlined in the OpenSecrets API documentation.

2. Upon completion, a `Pry` session will open and you can run, `GetData.politicians` to view an array of hashes of your retrieved data.

3. If the data looks fine, run (in `Pry`):
   
   `load './config/environment.rb'`  
   `load './app/models/politician.rb'`  
   `Politician.seed_politicians`  
   
   and your `db` will be populated to work with.

## Built With

- [OpenSecrets API](https://www.opensecrets.org/open-data/api) - Open Data for Congress
- [RESTClient](https://github.com/rest-client/rest-client) - HTTP and REST client for Ruby

## Contributing

Please read [CONTRIBUTING.md](https://github.com/rscheiwe/pocket-politician/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

- Katrina Garloff - [GitHub Profile](https://github.com/katrinagarloff)
- Richard Scheiwe - [GitHub Profile](https://github.com/rscheiwe)

## License

This project is licensed under the MIT License - see [LICENSE.md](LICENSE.md) file for details. 

## Acknowledgments

* Hat tip to [Arren Alexander](https://github.com/aalexander3) for the inspiration!



```
                       __              __      
                      /\ \            /\ \__   
 _____     ___     ___\ \ \/'\      __\ \ ,_\  
/\ '__`\  / __`\  /'___\ \ , <    /'__`\ \ \/  
\ \ \L\ \/\ \L\ \/\ \__/\ \ \\`\ /\  __/\ \ \_ 
 \ \ ,__/\ \____/\ \____\\ \_\ \_\ \____\\ \__\
  \ \ \/  \/___/  \/____/ \/_/\/_/\/____/ \/__/
   \ \_\                                       
    \/_/         
    
               ___        __                                        
              /\_ \    __/\ \__  __          __                     
 _____     ___\//\ \  /\_\ \ ,_\/\_\    ___ /\_\     __      ___    
/\ '__`\  / __`\\ \ \ \/\ \ \ \/\/\ \  /'___\/\ \  /'__`\  /' _ `\  
\ \ \L\ \/\ \L\ \\_\ \_\ \ \ \ \_\ \ \/\ \__/\ \ \/\ \L\.\_/\ \/\ \ 
 \ \ ,__/\ \____//\____\\ \_\ \__\\ \_\ \____\\ \_\ \__/.\_\ \_\ \_\
  \ \ \/  \/___/ \/____/ \/_/\/__/ \/_/\/____/ \/_/\/__/\/_/\/_/\/_/
   \ \_\                                                            
    \/_/                                                            

v.1.2.10
```

                                                                    

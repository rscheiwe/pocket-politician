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

## Authors

- Katrina Garloff - [GitHub Profile](https://github.com/katrinagarloff)
- Ricahrd Scheiwe - [GitHub Profile](https://github.com/rscheiwe)

## License

This project is licensed under the MIT License - see 



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

```
```
·····sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssse····
····)QQQQQQQQQQQQQQQQQQQQQQQQSdPPPbPSSQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQQQbbb··············bbPSSQQQQQQQQQQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQSbb······p··psssspp··········bDbbSSQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQSb····psQSb···············Dep···········QQQQQQQQQQQQQQQQQ····
····sQQQQQQQQQQQQQQp···(QQb······················e·········)QQQQQQQQQQQQQQQb····
····sQQQQQQQQQQQQQSb··sQS···············(·p·p······s·········)QQQQQQQQQQQQQb····
····sQQQQQQQQQQQQQQ·)QQb····s·········S·)QQQQQsp····)p·······sQQQQQQQQQQQQQb····
····QQQQQQQQQQQQQQQsQQb··sQQQQQQsep···SQQQSD····)p···)p·····)QQQQQQQQQQQQQQb····
····QQQQQQQQQQQQQS)QQQbsSGSb·(bSQQb····SO)sb·p·)Q·S···Q··S··)QQQQQQQQQQQQQQb····
····SQQQQQQQQQQQC···QQQQQSCpssQSPbS·······bbbbbb··e···Q··Q)s)QQQQQQQQQQQQQQb····
····QQQQQQQQQQQQb··sQQQQQSbbb····S············P·D·····)p·SQQsQQQQQQQQQQQQQQb····
····QQQQQQQQQQQQb·sQQQQbGpss····)QssQQQ·)··············Q·QQQQQQQQQQQQQQQQQQ·····
····QQQQQQQQQQQQQQQQQQ··········)QQQQSQQe·o············)·QQQQQQQQQQQQQQQQQQ·····
····QQQQQQQQQQQQQQQQQQsssQ·····)dSPb···)···u············p)QQQQQQQQQQQQQQQQQ·····
····QQQQQQQQQQQQQQQQQQQQQQQ···)·····ppp·················Q·)QQQQQQQQQQQQQQQQ·····
····QQQQQQQQQQQQQQQQQQQQQQQ··(b·sSb······CPe············)·Q··b)QQQQQQQQQQQQ·····
····QQQQQQQQQQQQQQQQQQQQQQQ··C)S)QQQQSSSSep·············sS····dQQQQQQQQQQQQ·····
····SQQQQQQQQQQQQQQQQQQQQQQ·S·)QQQS············e········Qb····QQQQQQQQQQQQQp····
····QQQQQQQQQQQQQQQSbGQQQQQQp(b························QQssssQQQQQQQQQQQQQQb····
····QQQQQQQQQQQQQQQQQsQQQQQQQQsssssQQQQQQQQsQQQQQQsssQQQQQQQQQQQQQQQQQQQQQQb····
····QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQb····
····QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQDSQSQQQQQQQQQQQQQQQQb····
····SQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ·sQQSQQQQQQQQQQQQQQQb····
····)QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQO·QQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQOsQQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQQSGQQQQQQQQQQQQQQQQQQQQQQQQSSb·)QQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQS···(bQQQQQQQQQQQQQQQQSPb······)QQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQ········D·DbbQQQQQQQQ··········)QQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQ··········)QQQQQp)QQQQQ········)QQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQQ·········S··PSQQQ)QQQSSbp······)QQQQQQQQQQQQQQQQQQQQ····
····)QQQQQQQQQQQQQQQQQQb·······sb····sQS)QPb·····Q·····)QQQQQQQQQQQQQQQQQQS·····
····)QQQQQQQQQQQQQQQQQQb······S····sQQS·SQb·······Q····)QQQQQQQQQQQQQQQQQS······
····)QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQb·······
····)QQQQQQQQQQQQQQQQQQep·ss·)SQQSSSSQQb·ep·S·)e·)b·)Q·QQQQQQQQQQQQQQQQb········
····)QQQQQQQQQQQQQQQQQQQb·sQ·(Q·S·so·SQb·sb·S·)Q·)DQ·SdQQQQQQQQQQQQQQQb·········
····)QQQQQQQQQQQQQQQQQQQb·sQ·)b·S·sSSQQb·Pb·S·PP·sqQo·)QQQQQQQQQQQQQSb··········
····)QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ········
    
```
                                                                    

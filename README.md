# Homey Code Challenge

## Local Setup

### Prerequisites

- Docker version 20.10.24
- Ruby version 3.1.4

#### Steps

- `$ bunlde`
- `$ docker-compose up -d` # starts database container with Postgres DB on version 15.2
- `$ rails db:create`
- `$ rails db:migrate`
- `$ rails db:seed` # seed the database with default statused
- `$ rails s` # starts rails server
- visit [http://localhost:3000](http://localhost:3000)

#### Tests

- `$ bundle exec rspec`

#### Live version

Live version is available on [Heroku](https://homey-challenge.herokuapp.com)

### Notes

The application was build based on the following requirements in mind

| Qestion | Answers | Note |
|---------| --------| -----|
| What are the projects attributes | Name, address, description |
| Are the project attributes validated? | Yes, name and address nust not have more than 100 characters. Description has no limit |
| Are the updateable? | Yes |
| What are posible statuses of the project | Open, AML, Solicitor found, Solicitor paid, Memorandum created, Transaction form provided, Enquiry in progress, Mortgage report, Documents signed, Deposit paid, Full amount paid, Closed |
| Does project must have status | Yes, default status is Open. It will be set when project is created |
| Do we want to change title of the status in the future | Yes, it is possible that we will change that |
| If we want to change it in the future do we want to keep the original names or we want them to change | Past statuses can be changed | Implemented via relation of project and states |
| How the comment can be long | Must not be empty, Max 255 chars |
| Can I move betewent states? If so what are the rules | Yes | TBC |
| What states allow me to comment | All states are allowed to comment except Closed. When project is closed is not allowed to comment | Not implemented |
| When deleting project do we want to delet it for good or keep it in DB | We want to keep it | Not implemented |
| Can I update the past comment | No |
| Can I delta past comment| No |
| Do we want to display time of comment | Yes | Not implemented |
| Do we want to display author of comment | Yes | Not implemented |
| Do we want to display who updated staus | Yes | Not implemented |
| Who can comment? Only authorities (sollicitors, brokers) or all (buyers sellers as well) | Yes | Rules TBC |
| Who can see what |  | TBC |


### Next steps
- [ ] Validate comment to not have more than 255 characters
- [ ] Improve UX for validation messages
- [ ] When deleting project flag it with deleted: true and list only project flagged as deleted: false
- [ ] Chronologicaly display coments and statuses
- [ ] Control status flow
- [ ] Display author and time of comment
- [ ] Display who updated status of Project
- [ ] Uses Slim templating system and Tilwind for stiling
- [ ] Use Hotwire to improve UX  

# My Bookish

The story of my_bookish is [here](https://github.com/yauralee/bookish).       
There is a public trello board [my bookish](https://trello.com/b/SkJG2L6q/my-bookish) show the card and detail task for each story.                       

## story 001 : prepare environment
###  Create atabase:  
          
 1. **select databse category and prepare:**               
     Use postgres replace sqlite, the first configuration is to set the `database.yml`.    
            
 2. **The commonds to operate databse:**                         
  `create role "bookish-admin" with login password 'password';`
  `create database bookish with owner "bookish-admin";`
  `psql -U postgres -l` : show all database belong to default owner "postgres".             
  `psql -d bookish -U "bookish-admin”`: access to ceratian database.             
  `create table "test_table"(t int not null);`: create a table in database, "t" is the attribute.       
  
## story 002 : set navigation 

### Analyze requirement: 
The story need to show a page with navigation even if there is no clear action, so just set a _welcome#index_ action for this story temporarily.  
            
### view for the navigation:

  1. **choose the way to render view:**                     
  Here choose to use rails view handle the requirement. And the views in follow stories use this way similarly. Use rails view is good for exercise the interaction between rails controller and view, but this function will push all the pressure to server side, the server side need to handle the request from client, deal it is not enough, also need to render the handle result before returning response to client.                          
  The other practise way is let browser to render the data return from server, this way can reduce the server side pressure. These are two different ways to design my_bookish, maybe the second way need apply _javascript_.  
                  
  2. **rails view guide:**                     
  (1)[Action View Overview](http://guides.rubyonrails.org/action_view_overview.html)The document is important and there are some commonly used knowledge, including:                
     **Templates, Partials and Layouts**(keyword: _ERB_, _jubilder_, _Partials_, _Layouts_)                         
     **Overview of helpers provided by Action View** part is userful (keword: _FormHelper_, _FromTagHelper_). There is a _JavaScriptHelper_ maybe can used for js when refactor.   
                
  (2)According to the Rails guide, the navigation should be put in a layout. Layout can use a template to let views reuse it. Each page need this navigation can only include the different part of view in their own file. And use `yield` in the layout to represent the different part. So here the layout is in `"views\layouts\bookish.html.erb"`.      
        
  3. **css**               
  The css should put in `aap\assets\stylesheets`. It's better to use only one file to include all css in similar pages. And use `<%= stylesheet_link_tag "bookish" %>`to link the stylesheet in the view. Here use `bookish.css` file.
  
## story 003 : show all bookishes in main page

### Analyze requirement: 
The bookishes data is put in a json file, the first step is insert these data into database. So create a table `bookish`, and use rakefile `lib\tasks\book.rake` to create bookish record. The premise is put the json in `lib\assets\book.json`. And then run rake.            
The story need show four bookishes in one line. This can be done by _bootstrap_.           

### create bookish table:
Because bookish include an array style attribute, if just let this column style equal array when generate migartion, this data style can not be migrate successfully.  
              
  1. **generate migration**
`rails g model Bookish title:string author:array published_at:string isbn:array asin:string`

2. **run migration**
`undefined method 'array' for #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition:0x007fd5ebe236f0>`

3. **change migration file**
`t.string :author, array: true, default: []`

### insert data:

1. **generate rake file**           
`rails g task book initialize_books`
This commond will generate `lib\tasks\book.rake` with namespace `book` and task `initialize_books`. Then put the json file in `lib\assets\book.json`.Then load the json file in rake file and create bookish records.    
    
2. **execute rake**      
`rake book:initialize_book`      
`select * from bookishes;` 

### show bookishes with view:
Here can reuse the layout created in story 002. 
          
1. **reuse layout**             
put `layout "bookish"`in `boojishes_controller.rb`, this line of code let all the views ralated to the bookish action will reuse the layout. `"bookish"`is the layout name.  
         
2. **bookish#index view**                    
use `views\bookishes\index.html.erb`to represent view corresponding to index action, when rails execute the index action, it can find the view automatically。Just need let the view name same to the action.  
         
3. **use bootstrap in view**                
(1)Here choose to use bootstrap to show four bookished in one line. The first step is to download this framework and put the `bootstrap.min.css`in `app\assets\stylesheets`. And then use `  <%= stylesheet_link_tag "bootstrap.min" %>` to inlude it in bookish layout.                 
(2)In the index view, set tag class as `"col-md-12"` can set this tag occupy whole line beacuse bootstrap divide a line into 12 parts, change the data in`"col-md-12"`can set the width. This way is easy than set width of the percentage in css file.
      


# DefneCetinerTGY_Final
* Turkcell Geleceği Yazanlar 2023 Dönemi, 2. Proje
----------------------------------------------------------------------------------
## iTunes App 
* It is a music listening application created using Apple's API.
* API: https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/ui``099d/TP40017632-CH5-SW1![image](https://github.com/defnecetinerr/DefneCetinerTGY_Final/assets/96814278/e0432863-5571-48d0-a38a-dd2fe77cac6d)


----------------------------------------------------------------------------------
## Functional Features
* On the homepage, users can search for any artist or music they want from the searchBar.
* Listed results are shown in tableView cells.
* By clicking the play button on the cell, users can play and pause the music.
* While a music is playing on the cell, the music on another cell cannot be played.
* If the user wants to pause the music and play it again, the music can resume from where it left off.
* When the user clicks on the desired cell, the detail page of the music track is accessed.
* On this detail page, the user can favorite and remove the music they want. An alert is shown to the user on unfavoring.
* On the detail page, when the music is stopped and played again, it will continue playing from where it left off.
* If the music on the main page is playing during the transition of the detail table on the main page, the music is stopped in the detail view.

----------------------------------------------------------------------------------
## Used technologies
* This application is written as modular.
* Two third party libraries were used. These are Alamofire and SDWebImage.
* Add to favorites feature is written using Core Data.
* Network operations implemented
* It was created in accordance with the Auto Layout Rules.
* Unit test and UI Test are written.
* The project was built using Viper architecture <br>

![viper](https://github.com/defnecetinerr/DefneCetinerTGY_Final/assets/96814278/2e0f1641-850a-4908-8175-2dcfb9fcd263)   <br>

----------------------------------------------------------------------------------
### What are the advantages of Viper?
* It increases the testability of the code.
* It increases the renewability of the application as it breaks it down into parts.
* It increases the readability of the code. <br>

### What are the disadvantages?
* It is difficult to use in small projects.
* In large projects, everyone in the team should know this pattern and fit the model correctly according to the project.
* It can create complexity because there are many folders and delegates in the project.  <br>

----------------------------------------------------------------------------------
## Screenshots 

![6](https://github.com/defnecetinerr/DefneCetinerTGY_Final/assets/96814278/ef8906cf-0eea-46e6-a2ee-7d6df77850d2)
![7](https://github.com/defnecetinerr/DefneCetinerTGY_Final/assets/96814278/351c2438-c868-428d-b9fa-3dcb6bfa5e9f)
![8](https://github.com/defnecetinerr/DefneCetinerTGY_Final/assets/96814278/8aa163d3-1dc0-45d4-9f26-0a48eb0c94f4)



# QuickieNews

QuickieNews is a Tinder-like iOS application replacing people by news. Swipe left to skip, right to read later and up to read now.
You can select some preset topics as Science, Sport, Politic, Technology... and many more!

<p float="left">
  <image src="https://user-images.githubusercontent.com/22772021/62141620-305e7200-b2ed-11e9-8ce4-546ce6e22dc5.png" width="290"/>
  <image src="https://user-images.githubusercontent.com/22772021/62141624-318f9f00-b2ed-11e9-9178-17bcc944cb87.png" width="290"/>
  <image src="https://user-images.githubusercontent.com/22772021/62141747-63086a80-b2ed-11e9-9d89-04ef111dd9bf.png" width="290"/>
</p>

## API

QuickieNews uses the [News API](https://newsapi.org) to fetch news corresponding to a topic.

## Architecture

QuickieNews uses the MVC architecture with Managers and Services to link it to API.

Services are used to fetch all the data from the API and Managers are used to reorganize data before passing it to ViewControllers.

## Cocoapod

QuickieNews uses some pods: 

|**Pods**|**Version**|
-------------|-------------|
| Alamofire | 4.7.3 |
| SwiftyJSON | 3.1.4 |
| R | 3.2.0 |
| RxSwift | 3.2.0 | 
| RxCocoa | 3.2.0 |
| SDWebImage | 3.8.0 |
| SwiftLint | 0.27.0 |
| Hero | 1.3.0 |

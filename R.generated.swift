//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 5 files.
  struct file {
    /// Resource file `Montserrat-Bold.otf`.
    static let montserratBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Bold", pathExtension: "otf")
    /// Resource file `Montserrat-ExtraLight.otf`.
    static let montserratExtraLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ExtraLight", pathExtension: "otf")
    /// Resource file `Montserrat-ExtraLightItalic.otf`.
    static let montserratExtraLightItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-ExtraLightItalic", pathExtension: "otf")
    /// Resource file `Montserrat-Medium.otf`.
    static let montserratMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Medium", pathExtension: "otf")
    /// Resource file `Montserrat-Regular.otf`.
    static let montserratRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Regular", pathExtension: "otf")
    
    /// `bundle.url(forResource: "Montserrat-Bold", withExtension: "otf")`
    static func montserratBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ExtraLight", withExtension: "otf")`
    static func montserratExtraLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratExtraLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-ExtraLightItalic", withExtension: "otf")`
    static func montserratExtraLightItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratExtraLightItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Medium", withExtension: "otf")`
    static func montserratMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Montserrat-Regular", withExtension: "otf")`
    static func montserratRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 5 fonts.
  struct font: Rswift.Validatable {
    /// Font `Montserrat-Bold`.
    static let montserratBold = Rswift.FontResource(fontName: "Montserrat-Bold")
    /// Font `Montserrat-ExtraLightItalic`.
    static let montserratExtraLightItalic = Rswift.FontResource(fontName: "Montserrat-ExtraLightItalic")
    /// Font `Montserrat-ExtraLight`.
    static let montserratExtraLight = Rswift.FontResource(fontName: "Montserrat-ExtraLight")
    /// Font `Montserrat-Medium`.
    static let montserratMedium = Rswift.FontResource(fontName: "Montserrat-Medium")
    /// Font `Montserrat-Regular`.
    static let montserratRegular = Rswift.FontResource(fontName: "Montserrat-Regular")
    
    /// `UIFont(name: "Montserrat-Bold", size: ...)`
    static func montserratBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratBold, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ExtraLight", size: ...)`
    static func montserratExtraLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratExtraLight, size: size)
    }
    
    /// `UIFont(name: "Montserrat-ExtraLightItalic", size: ...)`
    static func montserratExtraLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratExtraLightItalic, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Medium", size: ...)`
    static func montserratMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratMedium, size: size)
    }
    
    /// `UIFont(name: "Montserrat-Regular", size: ...)`
    static func montserratRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratRegular, size: size)
    }
    
    static func validate() throws {
      if R.font.montserratExtraLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ExtraLightItalic' could not be loaded, is 'Montserrat-ExtraLightItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Medium' could not be loaded, is 'Montserrat-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratExtraLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-ExtraLight' could not be loaded, is 'Montserrat-ExtraLight.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Bold' could not be loaded, is 'Montserrat-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Regular' could not be loaded, is 'Montserrat-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `later`.
    static let later = Rswift.ImageResource(bundle: R.hostingBundle, name: "later")
    /// Image `nope`.
    static let nope = Rswift.ImageResource(bundle: R.hostingBundle, name: "nope")
    /// Image `now`.
    static let now = Rswift.ImageResource(bundle: R.hostingBundle, name: "now")
    /// Image `placeholder`.
    static let placeholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "placeholder")
    /// Image `tabbar_articles_inactive`.
    static let tabbar_articles_inactive = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabbar_articles_inactive")
    /// Image `tabbar_category_inactive`.
    static let tabbar_category_inactive = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabbar_category_inactive")
    /// Image `tabbar_home_active`.
    static let tabbar_home_active = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabbar_home_active")
    /// Image `tabbar_home_inactive`.
    static let tabbar_home_inactive = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabbar_home_inactive")
    
    /// `UIImage(named: "later", bundle: ..., traitCollection: ...)`
    static func later(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.later, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "nope", bundle: ..., traitCollection: ...)`
    static func nope(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.nope, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "now", bundle: ..., traitCollection: ...)`
    static func now(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.now, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "placeholder", bundle: ..., traitCollection: ...)`
    static func placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.placeholder, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tabbar_articles_inactive", bundle: ..., traitCollection: ...)`
    static func tabbar_articles_inactive(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabbar_articles_inactive, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tabbar_category_inactive", bundle: ..., traitCollection: ...)`
    static func tabbar_category_inactive(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabbar_category_inactive, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tabbar_home_active", bundle: ..., traitCollection: ...)`
    static func tabbar_home_active(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabbar_home_active, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tabbar_home_inactive", bundle: ..., traitCollection: ...)`
    static func tabbar_home_inactive(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabbar_home_inactive, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `ArticleCardView`.
    static let articleCardView = _R.nib._ArticleCardView()
    /// Nib `ArticleCell`.
    static let articleCell = _R.nib._ArticleCell()
    
    /// `UINib(name: "ArticleCardView", in: bundle)`
    static func articleCardView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.articleCardView)
    }
    
    /// `UINib(name: "ArticleCell", in: bundle)`
    static func articleCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.articleCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `CategoryCell`.
    static let categoryCell: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "CategoryCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 5 storyboards.
  struct storyboard {
    /// Storyboard `Articles`.
    static let articles = _R.storyboard.articles()
    /// Storyboard `Category`.
    static let category = _R.storyboard.category()
    /// Storyboard `Home`.
    static let home = _R.storyboard.home()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "Articles", bundle: ...)`
    static func articles(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.articles)
    }
    
    /// `UIStoryboard(name: "Category", bundle: ...)`
    static func category(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.category)
    }
    
    /// `UIStoryboard(name: "Home", bundle: ...)`
    static func home(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.home)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 7 localization keys.
    struct localizable {
      /// en translation: An error occurs
      /// 
      /// Locales: en
      static let internal_error_no_code = Rswift.StringResource(key: "internal_error_no_code", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Home
      /// 
      /// Locales: en
      static let tabbar_home = Rswift.StringResource(key: "tabbar_home", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: My articles
      /// 
      /// Locales: en
      static let tabbar_articles = Rswift.StringResource(key: "tabbar_articles", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: My articles to read
      /// 
      /// Locales: en
      static let read_later_title = Rswift.StringResource(key: "read_later_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: My topics
      /// 
      /// Locales: en
      static let tabbar_categories = Rswift.StringResource(key: "tabbar_categories", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Published on the %@
      /// 
      /// Locales: en
      static let article_card_date = Rswift.StringResource(key: "article_card_date", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: You didn't selected any topic
      /// 
      /// Locales: en
      static let home_no_category = Rswift.StringResource(key: "home_no_category", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
      /// en translation: An error occurs
      /// 
      /// Locales: en
      static func internal_error_no_code(_: Void = ()) -> String {
        return NSLocalizedString("internal_error_no_code", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Home
      /// 
      /// Locales: en
      static func tabbar_home(_: Void = ()) -> String {
        return NSLocalizedString("tabbar_home", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: My articles
      /// 
      /// Locales: en
      static func tabbar_articles(_: Void = ()) -> String {
        return NSLocalizedString("tabbar_articles", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: My articles to read
      /// 
      /// Locales: en
      static func read_later_title(_: Void = ()) -> String {
        return NSLocalizedString("read_later_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: My topics
      /// 
      /// Locales: en
      static func tabbar_categories(_: Void = ()) -> String {
        return NSLocalizedString("tabbar_categories", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Published on the %@
      /// 
      /// Locales: en
      static func article_card_date(_ value1: String) -> String {
        return String(format: NSLocalizedString("article_card_date", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: You didn't selected any topic
      /// 
      /// Locales: en
      static func home_no_category(_: Void = ()) -> String {
        return NSLocalizedString("home_no_category", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _ArticleCardView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ArticleCardView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _ArticleCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ArticleCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> ArticleCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ArticleCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try articles.validate()
      try home.validate()
      try category.validate()
    }
    
    struct articles: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let articleReaderViewController = StoryboardViewControllerResource<ArticleReaderViewController>(identifier: "ArticleReaderViewController")
      let articlesNavigationController = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "ArticlesNavigationController")
      let articlesViewController = StoryboardViewControllerResource<ReadLaterViewController>(identifier: "ArticlesViewController")
      let bundle = R.hostingBundle
      let name = "Articles"
      
      func articleReaderViewController(_: Void = ()) -> ArticleReaderViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: articleReaderViewController)
      }
      
      func articlesNavigationController(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: articlesNavigationController)
      }
      
      func articlesViewController(_: Void = ()) -> ReadLaterViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: articlesViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.articles().articlesViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'articlesViewController' could not be loaded from storyboard 'Articles' as 'ReadLaterViewController'.") }
        if _R.storyboard.articles().articleReaderViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'articleReaderViewController' could not be loaded from storyboard 'Articles' as 'ArticleReaderViewController'.") }
        if _R.storyboard.articles().articlesNavigationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'articlesNavigationController' could not be loaded from storyboard 'Articles' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct category: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let categoriesViewController = StoryboardViewControllerResource<CategoriesViewController>(identifier: "CategoriesViewController")
      let name = "Category"
      
      func categoriesViewController(_: Void = ()) -> CategoriesViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: categoriesViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.category().categoriesViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'categoriesViewController' could not be loaded from storyboard 'Category' as 'CategoriesViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct home: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let homeNavigationController = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "HomeNavigationController")
      let homeViewController = StoryboardViewControllerResource<HomeViewController>(identifier: "HomeViewController")
      let name = "Home"
      
      func homeNavigationController(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: homeNavigationController)
      }
      
      func homeViewController(_: Void = ()) -> HomeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: homeViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.home().homeViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'homeViewController' could not be loaded from storyboard 'Home' as 'HomeViewController'.") }
        if _R.storyboard.home().homeNavigationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'homeNavigationController' could not be loaded from storyboard 'Home' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = TabBarController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}

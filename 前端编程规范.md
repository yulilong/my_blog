**目录**

[TOC]

## **一、单一职责**    

### **1. 单一法则**   

* 坚持每个文件只定义一样东西（例如服务或组件）, 考虑把文件大小限制在 400 行代码以内。      

***这么做的理由：***   

* 单组件文件非常容易阅读、维护，并能防止在版本控制系统里与团队冲突。      
* 单组件文件可以防止一些隐蔽的程序缺陷，当把多个组件合写在同一个文件中时，可能造成共享变量、创建意外的闭包，或者与依赖之间产生意外耦合等情况。     
* 单独的组件通常是该文件默认的导出，可以用路由器实现按需加载。      
* 最关键的是，可以增强代码可重用性和阅读性，减少出错的可能性。


### 2. 简单函数    

* 坚持定义简单函数，考虑限制在 75 行之内。      

***这么做的理由：***   

* 简单函数更易于测试，特别是当它们只做一件事，只为一个目的服务时。      
* 简单函数促进代码重用。     
* 简单函数更易于阅读。     
* 简单函数更易于维护。     
* 简单函数可避免易在大函数中产生的隐蔽性错误，例如与外界共享变量、创建意外的闭包或与依赖之间产生意外耦合等。     

--------------------

## **二、命名**     

* 命名约定对可维护性和可读性非常重要。本指南为文件名和符号名推荐了一套命名约定。     

### **1. 总体命名指导原则**    

* 坚持所有符号使用一致的命名规则。      
* 坚持遵循同一个模式来描述符号的特性和类型。推荐的模式为feature.type.ts。       

***这么做的理由：***    
  
* 命名约定提供了一致的方式来查找内容，让我们一眼就能锁定。 项目的一致性是至关重要的。团队内的一致性也很重要。整个公司的一致性会提供惊人的效率。      
* 命名约定帮助我们更快得找到不在手头的代码，更容易理解它。    
* 目录名和文件名应该清楚的传递它们的意图。 例如，app/heroes/hero-list.component.ts包含了一个用来管理英雄列表的组件。     

### **2. 使用点和横杠来分隔文件名**      

* 坚持在描述性名字中，用横杠来分隔单词。   
* 坚持使用点来分隔描述性名字和类型。    
* 坚持遵循先描述组件特性，再描述它的类型的模式，对所有组件使用一致的类型命名规则。推荐的模式为feature.type.ts。     
* 坚持使用惯用的后缀来描述类型，包括*.service、*.component、*.pipe、.module、.directive。 必要时可以创建更多类型名，但必须注意，不要创建太多。       

***这么做的理由：***     

* 类型名字提供一致的方式来快速的识别文件中有什么。     
* 利用编辑器或者 IDE 的模糊搜索功能，可以很容易地找到特定文件。    
* 像.service这样的没有简写过的类型名字，描述清楚，毫不含糊。 像.srv, .svc, 和 .serv这样的简写可能令人困惑。      
* 为自动化任务提供模式匹配。      

### **3. 符号名与文件名**     

* 坚持为所有东西使用一致的命名约定，以它们所代表的东西命名。       
* 坚持使用大写驼峰命名法来命名类。符号名匹配它所在的文件名。       
* 坚持在符号名后面追加约定的类型后缀（例如Component、Directive、Module、Pipe、Service）。      
* 坚持在符号名后面追加约定的类型后缀（例如.component.ts、.directive.ts、.module.ts、.pipe.ts、.service.ts）。     
* 坚持在文件名后面追加约定的类型后缀（例如.component.ts、.directive.ts、.module.ts、.pipe.ts、.service.ts）。     

***这么做的理由：***      

* 遵循一致的约定可以快速识别和引用不同类型的资产。       

```
# app.component.ts
@Component({ ... })
export class AppComponent { }

# hero-list.component.ts 
@Component({ ... })
export class HeroListComponent { }

# validation.directive.ts
@Directive({ ... })
export class ValidationDirective { }

# app.module.ts 
@NgModule({ ... })
export class AppModule

# init-caps.pipe.ts
@Pipe({ name: 'initCaps' })
export class InitCapsPipe implements PipeTransform { }

# user-profile.service.ts
@Injectable()
export class UserProfileService { }
```

### **4. 服务名**   

* 坚持使用一致的规则命名服务，以它们的特性来命名。     
* 坚持为服务的类名加上Service后缀。 例如，获取数据或英雄列表的服务应该命名为DataService或HeroService。     

***这么做的理由：***      

* 提供一致的方式来快速识别和引用服务。      

```
# hero-data.service.ts
@Injectable()
export class HeroDataService { }

# credit.service.ts
@Injectable()
export class CreditService { }
```

### **5. 指令选择器**  

* 坚持使用小驼峰命名法来命名指令的选择器。      

***这么做的理由：***      

* 保持指令中定义的属性名与绑定的视图 HTML 属性名字一致。     
* Angular HTML 解析器是大小写敏感的，它识别小写驼峰写法。      

### **6. 为组件添加自定义前缀**   

* 坚持使用带连字符的小写元素选择器值（例如admin-users）。     
* 坚持为组件选择器添加自定义前缀。 例如，toh前缀表示 Tour of Heroes（英雄指南），而前缀`admin表示管理特性区。     
* 坚持使用前缀来识别特性区或者应用程序本身。    

***这么做的理由：***       

* 防止与其它应用中的组件和原生 HTML 元素发生命名冲突。      
* 更容易在其它应用中推广和共享组件。      
* 组件在 DOM 中更容易被区分出来。       

```
# app/users/users.component.ts   
@Component({
  selector: 'admin-users'    # 这里为users添加一个前缀 admin
})
export class UsersComponent {}
```

### **7. 为指令添加自定义前缀**    

* 坚持为指令的选择器添加自定义前缀（例如前缀toh来自Tour of Heroes）。        
* 坚持用小驼峰形式拼写非元素选择器，除非该选择器用于匹配原生 HTML 属性。      

***这么做的理由：***        

* 防止名字冲突。      
* 指令更加容易被识别。      
 
```
@Directive({
  selector: '[tohValidate]'    # 为 Validate 添加一个前缀toh
})
export class ValidateDirective {}
```

### **8. 管道名**     

* 坚持为所有管道使用一致的命名约定，用它们的特性来命名。       

***这么做的理由：***        

* 提供一致方式快速识别和引用管道。        

### **9. 单元测试文件名**        

* 坚持测试规格文件名与被测试组件文件名相同。        
* 坚持测试规格文件名添加.spec后缀。          

***这么做的理由：***       
  
* 提供一致的方式来快速识别测试。         
* 提供一个与 karma 或者其它测试运行器相配的命名模式。         

###  **10. 端到端测试文件名**       

* 坚持端到端测试规格文件和它们所测试的特性同名，添加.e2e-spec后缀。         

***这么做的理由：***      
   
* 提供一致的方式快速识别端到端测试文件。        
* 提供一个与测试运行器和构建自动化匹配的模式。          
```
app.e2e-spec.ts
heroes.e2e-spec.ts
```

### **11. Angular NgModule 命名**       

* 坚持为符号名添加Module后缀.         
* 坚持为文件名添加.module.ts扩展名。         
* 坚持用特性名和所在目录命名模块。
* 坚持为 RoutingModule 类名添加RoutingModule后缀。       
* 坚持为 RoutingModule 的文件名添加-routing.module.ts后缀。

***这么做的理由：***          

* 提供一致的方式来快速标识和引用模块。          
* 大驼峰命名法是一种命名约定，用来标识可用构造函数实例化的对象。           
* 很容易就能看出这个模块是同名特性的根模块。        
* RoutingModule是一种专门用来配置 Angular 路由器的模块。 “类名和文件名保持一致”的约定使这些模块易于发现和验证。
```
# app.module.ts 
@NgModule({ ... })
export class AppModule { }    

# heroes.module.ts
@NgModule({ ... })
export class HeroesModule { }

# villains.module.ts
@NgModule({ ... })
export class VillainsModule { }

# app-routing.module.ts
@NgModule({ ... })
export class AppRoutingModule { }

# heroes-routing.module.ts
@NgModule({ ... })
export class HeroesRoutingModule { }

```    

--------------

## **三、编程约定**    

* 坚持一致的编程、命名和空格的约定。

### **1. 类**    

* 坚持使用大写驼峰命名法来命名类。      

***这么做的理由：***        
  
* 遵循类命名传统约定。         
* 类可以被实例化和构造实例。根据约定，用大写驼峰命名法来标识可构造的东西。         
```
export class ExceptionService {
  constructor() { }
}
```     

### **2. 常量**       

* 坚持用const声明变量，除非它们的值在应用的生命周期内会发生变化。        
* 考虑 把常量名拼写为小驼峰格式。       
* 坚持容许现存的const常量沿用大写蛇形命名法。

***这么做的理由：***      

* 告诉读者这个值是不可变的。        
* TypeScript 会要求在声明时立即初始化，并阻止再次赋值，以确保达成我们的意图。      
* 小驼峰变量名 (heroRoutes) 比传统的大写蛇形命名法 (HERO_ROUTES) 更容易阅读和理解。         
* 把常量命名为大写蛇形命名法的传统源于现代 IDE 出现之前， 以便阅读时可以快速发现那些const定义。 TypeScript 本身就能够防止意外赋值。         
* 传统的大写蛇形命名法仍然很流行、很普遍，特别是在第三方模块中。 修改它们没多大价值，还会有破坏现有代码和文档的风险。         
```
export const mockHeroes   = ['Sam', 'Jill']; // prefer
export const heroesUrl    = 'api/heroes';    // prefer
export const VILLAINS_URL = 'api/villains';  // tolerate
```

### **3. 接口**       

* 坚持使用大写驼峰命名法来命名接口。         
* 考虑不要在接口名字前面加I前缀。         
* 考虑用类代替接口。         

***这么做的理由：***       

* [TypeScript 指导原则](https://github.com/Microsoft/TypeScript/wiki/Coding-guidelines)不建议使用 “I” 前缀。     
* 单独一个类的代码量小于类+接口。         
* 类可以作为接口使用（只是用implements代替extends而已）。         
* 在 Angular 依赖注入系统中，接口类可以作为服务提供商的查找令牌。        
```
# app/shared/hero-collector.service.ts
import { Injectable } from '@angular/core';
import { Hero } from './hero.model';
@Injectable()
export class HeroCollectorService {
  hero: Hero;
  constructor() { }
}
```

### **4. 属性和方法**      

* 坚持使用小写驼峰命名法来命名属性和方法。           
* 避免为私有属性和方法添加下划线前缀。         

***这么做的理由：***        

* 遵循传统属性和方法的命名约定。           
* JavaScript 不支持真正的私有属性和方法。         
* TypeScript 工具让识别私有或公有属性和方法变得很简单。           
```
# app/shared/toast.service.ts
import { Injectable } from '@angular/core';
@Injectable()
export class ToastService {
  message: string;
  private toastCount: number;
  hide() {
    this.toastCount--;
    this.log();
  }
  show() {
    this.toastCount++;
    this.log();
  }
  private log() {
    console.log(this.message);
  }
}
```

### **5. 导入语句中的空行**         

* 坚持在第三方导入和应用导入之间留一个空行。        
* 考虑按模块名字的字母顺排列导入行。           
* 考虑在解构表达式中按字母顺序排列导入的东西。        

***这么做的理由：***         

* 空行可以让阅读和定位本地导入更加容易。        
* 按字母顺序排列可以让阅读和定位本地导入更加容易。        
```
# app/heroes/shared/hero.service.ts
import { Injectable } from '@angular/core';
import { Http }       from '@angular/http';

import { Hero } from './hero.model';
import { ExceptionService, SpinnerService, ToastService } from '../../core';
```
--------------
## **四、应用程序结构与 Angular 模块**         

* 准备一个近期实施方案和一个长期的愿景。从零开始，但要考虑应用程序接下来的路往哪儿走。         
* 所有应用程序的源代码都放到名叫src的目录里。 所有特性区都在自己的文件夹中，带有它们自己的 Angular 模块。         
* 所有内容都遵循每个文件一个特性的原则。每个组件、服务和管道都在自己的文件里。 所有第三方程序包保存到其它目录里，而不是src目录。 你不会修改它们，所以不希望它们弄乱我们的应用程序。 使用本指南介绍的文件命名约定。          

### **1. LIFT**      

* 坚持组织应用的结构，达到这些目的：快速定位 (Locate) 代码、一眼识别 (Identify) 代码、 尽量保持扁平结构 (Flattest) 和尝试 (Try) 遵循DRY (Do Not Repeat Yourself, 不重复自己) 原则。           
* 坚持四项基本原则定义文件结构，上面的原则是按重要顺序排列的。        

***这么做的理由：***         

* LIFT提供了一致的结构，它具有扩展性强、模块化的特性。因为容易快速锁定代码，提高了开发者的效率。 另外，检查应用结构是否合理的方法是问问自己：我们能快速打开与此特性有关的所有文件并开始工作吗？            

### **2. 定位**       

* 坚持直观、简单和快速地定位代码。        

***这么做的理由：***     
  
* 要想高效的工作，就必须能迅速找到文件，特别是当不知道（或不记得）文件名时。 把相关的文件一起放在一个直观的位置可以节省时间。 富有描述性的目录结构会让你和后面的维护者眼前一亮。        

### **3. 识别**        

* 坚持命名文件到这个程度：看到名字立刻知道它包含了什么，代表了什么。         
* 坚持文件名要具有说明性，确保文件中只包含一个组件。         
* 避免创建包含多个组件、服务或者混合体的文件。         

***这么做的理由：***       

* 花费更少的时间来查找和琢磨代码，就会变得更有效率。 较长的文件名远胜于较短却容易混淆的缩写名。         

### **4. 扁平**        

* 坚持尽可能保持扁平的目录结构。       
* 考虑当同一目录下达到 7 个或更多个文件时创建子目录。      
* 考虑配置 IDE，以隐藏无关的文件，例如生成出来的.js文件和.js.map文件等。       

***这么做的理由：***        

* 没人想要在超过七层的目录中查找文件。扁平的结构有利于搜索。             
* 另一方面，心理学家们相信， 当关注的事物超过 9 个时，人类就会开始感到吃力。 所以，当一个文件夹中的文件有 10 个或更多个文件时，可能就是创建子目录的时候了。             
* 还是根据你自己的舒适度而定吧。 除非创建新文件夹能有显著的价值，否则尽量使用扁平结构。            

### **5. T-DRY （尝试不重复自己）**         

* 坚持 DRY（Don't Repeat Yourself，不重复自己）。         
* 避免过度 DRY，以致牺牲了阅读性。           

***这么做的理由：***        

* 虽然 DRY 很重要，但如果要以牺牲 LIFT 的其它原则为代价，那就不值得了。 这也就是为什么它被称为 T-DRY。 例如，把组件命名为hero-view.component.html是多余的，因为带有.html扩展名的文件显然就是一个视图 (view)。 但如果它不那么显著，或不符合常规，就把它写出来。           

### **6. 总体结构指导原则**       

* 坚持从零开始，但要考虑应用程序接下来的路往哪儿走。        
* 坚持有一个近期实施方案和一个长期的愿景。           
* 坚持把所有源代码都放到名为src的目录里。          
* 坚持如果组件具有多个伴隨文件 (.ts、.html、.css和.spec)，就为它创建一个文件夹。          

***这么做的理由：***        

* 在早期阶段能够帮助保持应用的结构小巧且易于维护，这样当应用增长时就容易进化了。          
* 组件通常有四个文件 (*.html、 *.css、 *.ts 和 *.spec.ts)，它们很容易把一个目录弄乱。        
* 把组件放在专用目录中的方式广受欢迎，对于小型应用，还可以保持组件扁平化（而不是放在专用目录中）。 这样会把四个文件放在现有目录中，也会减少目录的嵌套。无论你如何选择，请保持一致。         

### **7. 按特性组织的目录结构**     

* 坚持根据特性区命名目录。       
* 坚持为每个特性区创建一个 Angular 模块。         

***这么做的理由：***    
     
* LIFT 原则中包含了所有这些。       
* 遵循 LIFT 原则精心组织内容，避免应用变得杂乱无章。        
* 当有很多文件时（例如 10 个以上），在专用目录型结构中定位它们会比在扁平结构中更容易。         
* Angular 模块使惰性加载可路由的特性变得更容易。       
* Angular 模块隔离、测试和复用特性更容易。      

### **8. 应用的根模块**      

* 坚持在应用的根目录创建一个 Angular 模块（例如/src/app）。     
* 考虑把根模块命名为app.module.ts。        

***这么做的理由：***        
 
* 每个应用都至少需要一个根 Angular 模块。       
* 能让定位和识别根模块变得更容易。          
```
# app/app.module.ts

import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent }    from './app.component';
import { HeroesComponent } from './heroes/heroes.component';
@NgModule({
  imports: [
    BrowserModule,
  ],
  declarations: [
    AppComponent,
    HeroesComponent
  ],
  exports: [ AppComponent ],
  entryComponents: [ AppComponent ]
})
export class AppModule {}
```

### **9. 特性模块**        

* 为应用中每个明显的特性创建一个 Angular 模块。     
* 坚持把特性模块放在与特性区同名的目录中（例如app/heroes）。        
* 坚持特性模块的文件名应该能反映出特性区的名字和目录（例如app/heroes/heroes.module.ts）。      
* 坚持特性模块的符号名应该能反映出特性区、目录和文件名（例如在app/heroes/heroes.module.ts中定义HeroesModule）。       

***这么做的理由：***        
 
* 特性模块可以对其它模块暴露或隐藏自己的实现。         
* 特性模块标记出组成该特性分区的相关组件集合。         
* 方便路由到特性模块 —— 无论是用主动加载还是惰性加载的方式。         
* 特性模块在特定的功能和其它应用特性之间定义了清晰的边界。         
* 特性模块帮助澄清开发职责，以便于把这些职责指派给不同的项目组。         
* 特性模块易于隔离，以便测试。         

### **10. 共享特性模块**       

* 坚持在shared目录中创建名叫SharedModule的特性模块（例如在app/shared/shared.module.ts中定义SharedModule）。      
* 坚持在共享模块中声明那些可能被特性模块引用的可复用组件、指令和管道。      
* 考虑把可能在整个应用中到处引用的模块命名为SharedModule.      
* 避免 在共享模块中提供服务。服务通常是单例的，应该在整个应用或一个特定的特性模块中只有一份。      
* 坚持在SharedModule中导入所有模块都需要的资产（例如CommonModule和FormsModule）。      
* 坚持在SharedModule中声明所有组件、指令和管道。      
* 坚持从SharedModule中导出其它特性模块所需的全部符号。      
* 避免在SharedModule中指定应用级的单例服务提供商。如果是刻意要得到多个服务单例也行，不过还是要小心。      

***这么做的理由：***      
   
* SharedModule中包含的组件、指令和管道可能需要来自其它公共模块的特性（例如来自CommonModule中的ngFor指令）。        
* SharedModule的存在，能让常用的组件、指令和管道在很多其它模块的组件模板中都自动可用。         
* 惰性加载的特性模块如果导入了这个共享模块，会创建一份自己的服务副本，这可能会导致意料之外的后果。      
* 为何？对于单例服务，你不希望每个模块都有自己的实例。 而如果SharedModule提供了一个服务，那就有可能发生这种情况。        


### **11. 核心特性模块**

* 考虑把那些数量庞大、辅助性的、只用一次的类收集到核心模块中，让特性模块的结构更清晰简明。            
* 坚持把那些“只用一次”的类收集到CoreModule中，并对外隐藏它们的实现细节。简化的AppModule会导入CoreModule，并且把它作为整个* 应用的总指挥。            
* 坚持在core目录下创建一个名叫CoreModule的特性模块（例如在app/core/core.module.ts中定义CoreModule）。            
* 坚持把要共享给整个应用的单例服务放进CoreModule中（例如ExceptionService和LoggerService）。            
* 坚持导入CoreModule中的资产所需要的全部模块（例如CommonModule和FormsModule）。            
* 坚持把应用级、只用一次的组件收集到CoreModule中。 只在应用启动时从AppModule中导入它一次，以后再也不要导入它（例如NavComponent和SpinnerComponent）。         

***这么做的理由：***         

* CoreModule提供了一个或多个单例服务。Angular使用应用的根注入器注册这些服务提供商，让每个服务的这个单例对象对所有需要它们的组件都是可用的，而不用管该组件是通过主动加载还是惰性加载的方式加载的。          
* CoreModule将包含一些单例服务。而如果是由惰性加载模块来导入这些服务，它就会得到一个新实例，而不是所期望的全应用级单例。   
* 真实世界中的应用会有很多只用一次的组件（例如加载动画、消息浮层、模态框等），它们只会在AppComponent的模板中出现。 不会在其它地方导入它们，所以没有共享的价值。 然而它们又太大了，放在根目录中就会显得乱七八糟的。    

### **12. 防止多次导入CoreModule**      

* 应该只有AppModule才允许导入CoreModule。     
* 坚持防范多次导入CoreModule，并通过添加守卫逻辑来尽快失败。   

***这么做的理由：***        

* 守卫可以阻止对CoreModule的多次导入。        
* 守卫会禁止创建单例服务的多个实例。       
 
### **13. 惰性加载的目录**        

* 某些边界清晰的应用特性或工作流可以做成惰性加载或按需加载的，而不用总是随着应用启动。       
* 坚持把惰性加载特性下的内容放进惰性加载目录中。 典型的惰性加载目录包含路由组件及其子组件以及与它们有关的那些资产和模块。    

***这么做的理由：***       

这种目录让标识和隔离这些特性内容变得更轻松。        

### **14. 永远不要直接导入惰性加载的目录**     

* 避免让兄弟模块和父模块直接导入惰性加载特性中的模块。      

***这么做的理由：***      

直接导入并使用此模块会立即加载它，而原本的设计意图是按需加载它。        

-----------------

## **五、组件**       

### **1. 组件选择器命名**

* 坚持使用中线 (dashed) 命名法或烤串 (kebab) 命名法来命名组件中的元素选择器。       

***这么做的理由：***      

* 保持元素命名与自定义元素命名规范一致。    
```
# app/heroes/shared/hero-button/hero-button.component.ts

@Component({
  selector: 'toh-hero-button',  
  templateUrl: './hero-button.component.html'
})
export class HeroButtonComponent {}

```

### **2. 把组件当做元素**     

* 坚持给组件一个元素选择器，而不是属性或类选择器。     


***这么做的理由：***      

* 组件有很多包含 HTML 以及可选 Angular 模板语法的模板。 它们显示内容。开发人员会把组件像原生HTML元素和WebComponents一样放进页面中。         
* 查看组件模板的 HTML 时，更容易识别一个符号是组件还是指令。     
不好的用法：        
```
# hero-button.component.ts
@Component({
  selector: '[tohHeroButton]',
  templateUrl: './hero-button.component.html'
})
export class HeroButtonComponent {}

# app.component.html
<div tohHeroButton></div>
```
好的做法：       
```
# hero-button.component.ts
@Component({
  selector: 'toh-hero-button',
  templateUrl: './hero-button.component.html'
})
export class HeroButtonComponent {}

# app.component.html
<toh-hero-button></toh-hero-button>
```

### **3. 把模板和样式提取到它们自己的文件**     

* 坚持当超过 3 行时，把模板和样式提取到一个单独的文件。     
* 坚持把模板文件命名为[component-name].component.html，其中，[component-name] 是组件名。       
* 坚持把样式文件命名为[component-name].component.css，其中，[component-name] 是组件名。       
* 坚持指定相对于模块的 URL ，给它加上./前缀。       

***这么做的理由：***      

* 巨大的、内联的模板和样式表会遮盖组件的意图和实现方式，削弱可读性和可维护性。       
* 在多数编辑器中，编写内联的模板和样式表时都无法使用语法提示和代码片段功能。 Angular的TypeScript语言服务（即将到来）可以帮助那些编辑器在编写HTML模板时克服这一缺陷，但对CSS样式没有帮助。       
* 当你移动组件文件时，相对于组件的URL不需要修改，因为这些文件始终会在一起。     
* ./前缀是相对URL的标准语法，不必依赖Angular的特殊处理，如果没有前缀则不行。         

### **4. 内联输入和输出属性装饰器**    

* 坚持 使用@Input()和@Output()，而非@Directive和@Component装饰器的inputs和outputs属性:        
* 坚持把@Input()或者@Output()放到所装饰的属性的同一行。     

***这么做的理由：***       

* 易于在类里面识别哪些属性是输入属性或输出属性。       
* 如果需要重命名与@Input或者@Output关联的属性或事件名，你可以在一个位置修改。             
* 依附到指令的元数据声明会比较简短，更易于阅读。     
* 把装饰器放到同一行可以精简代码，同时更易于识别输入或输出属性。       

不好的写法：    
```
# app/heroes/shared/hero-button/hero-button.component.ts
@Component({
  selector: 'toh-hero-button',
  template: `<button></button>`,
  inputs: [
    'label'
  ],
  outputs: [
    'change'
  ]
})
export class HeroButtonComponent {
  change = new EventEmitter<any>();
  label: string;
}
```     
好的写法：      
```
@Component({
  selector: 'toh-hero-button',
  template: `<button>{{label}}</button>`
})
export class HeroButtonComponent {
  @Output() change = new EventEmitter<any>();
  @Input() label: string;
}
```

### **5. 避免为输入和输出属性指定别名**     

* 避免除非有重要目的，否则不要为输入和输出指定别名。       

***这么做的理由：***        

* 同一个属性有两个名字（一个对内一个对外）很容易导致混淆。          
* 如果指令名也同时用作输入属性，而且指令名无法准确描述这个属性的用途时，应该使用别名。       

### **6. 成员顺序**    

* 坚持把属性成员放在前面，方法成员放在后面。    
* 坚持先放公共成员，再放私有成员，并按照字母顺序排列。           

***这么做的理由：***        

* 把类的成员按照统一的顺序排列，易于阅读，能立即识别出组件的哪个成员服务于何种目的。      

### **7. 把逻辑放到服务里**    

* 坚持在组件中只包含与视图相关的逻辑。所有其它逻辑都应该放到服务中。        
* 坚持把可重用的逻辑放到服务中，保持组件简单，聚焦于它们预期目的。          

***这么做的理由：***     

* 当逻辑被放置到服务里，并以函数的形式暴露时，可以被多个组件重复使用。         
* 在单元测试时，服务里的逻辑更容易被隔离。当组件中调用逻辑时，也很容易被模拟。          
* 从组件移除依赖并隐藏实施细节。      
* 保持组件苗条、精简和聚焦。          

### **8. 不要给输出属性加前缀**   

* 坚持命名事件时，不要带前缀on。      
* 坚持把事件处理器方法命名为on前缀之后紧跟着事件名。      

***这么做的理由：***     

* 与内置事件命名一致，例如按钮点击。       
* Angular 允许另一种备选语法 `on-*`。如果事件的名字本身带有前缀on，那么绑定的表达式可能是on-onEvent。    

不好的写法：   
```
# app/heroes/hero.component.ts
@Component({
  selector: 'toh-hero',
  template: `...`
})
export class HeroComponent {
  @Output() onSavedTheDay = new EventEmitter<boolean>();
}
```
好的写法：     
```
export class HeroComponent {
  @Output() savedTheDay = new EventEmitter<boolean>();
}
```

### **9. 把表现层逻辑放到组件类里**     

* 坚持把表现层逻辑放进组件类中，而不要放在模板里。      

***这么做的理由：***    

* 逻辑应该只出现在一个地方（组件类里）而不应分散在两个地方。      
* 将组件的表现层逻辑放到组件类而非模板里，可以增强测试性、维护性和重复使用性。       

不好的写法：    
```
@Component({
  selector: 'toh-hero-list',
  template: `
    <section>
      Our list of heroes:
      <hero-profile *ngFor="let hero of heroes" [hero]="hero">
      </hero-profile>
      Total powers: {{totalPowers}}<br>
      Average power: {{totalPowers / heroes.length}}  # 这里
    </section>
  `
})
export class HeroListComponent {
  heroes: Hero[];
  totalPowers: number;
}
```
好的写法：    
```
@Component({
  selector: 'toh-hero-list',
  template: `
    <section>
      Our list of heroes:
      <toh-hero *ngFor="let hero of heroes" [hero]="hero">
      </toh-hero>
      Total powers: {{totalPowers}}<br>
      Average power: {{avgPower}}
    </section>
  `
})
export class HeroListComponent {
  heroes: Hero[];
  totalPowers: number;
  get avgPower() {
    return this.totalPowers / this.heroes.length;
  }
```

----------------

## **六、指令**    

### **1. 使用指令来加强已有元素**          

* 坚持当你需要有表现层逻辑，但没有模板时，使用属性型指令。      

***这么做的理由：***       

* 属性型指令没有模板。      
* 一个元素可以使用多个属性型指令。      

### **2. HostListener 和 HostBinding 装饰器 vs. 组件元数据 host**    

* 考虑优先使用@HostListener和@HostBinding，而不是@Directive和@Component装饰器的host属性。      
* 坚持让你的选择保持一致。     

***这么做的理由：***       

* 对于关联到@HostBinding的属性或关联到@HostListener的方法，要修改时，只需在指令类中的一个地方修改。 如果使用元数据属性host，你就得在组件类中修改属性声明的同时修改相关的元数据。       
* host元数据只是一个便于记忆的名字而已，并不需要额外的 ES 导入。      

使用@HostListener和@HostBinding:         
```
# app/shared/validator.directive.ts   
import { Directive, HostBinding, HostListener } from '@angular/core';
@Directive({
  selector: '[tohValidator]'
})
export class ValidatorDirective {
  @HostBinding('attr.role') role = 'button';
  @HostListener('mouseenter') onMouseEnter() {
    // do work
  }
}
```
使用host元数据：    
```
import { Directive } from '@angular/core';
@Directive({
  selector: '[tohValidator2]',
  host: {
    'attr.role': 'button',
    '(mouseenter)': 'onMouseEnter()'
  }
})
export class Validator2Directive {
  role = 'button';
  onMouseEnter() {
    // do work
  }
}
```

-------------

## **七、服务**     

### **1. 服务总是单例的**    

* 坚持在同一个注入器内，把服务当做单例使用。用它们来共享数据和功能。      

***这么做的理由：***       

* 服务是在特性范围或应用内共享方法的理想载体。     
* 服务是共享状态性内存数据的理想载体。      

```
# app/heroes/shared/hero.service.ts
export class HeroService {
  constructor(private http: Http) { }
  getHeroes() {
    return this.http.get('api/heroes')
      .map((response: Response) => <Hero[]>response.json().data);
  }
}
```

### **2. 单一职责**

* 坚持创建单一职责的服务，用职责封装在它的上下文中。      
* 坚持当服务成长到超出单一用途时，创建一个新服务。     

***这么做的理由：***       

* 当服务有多个职责时，它很难被测试。     
* 当某个服务有多个职责时，每个注入它的组件或服务都会承担这些职责的全部开销。     

### **3. 提供一个服务**    

* 坚持将服务提供到共享范围内的顶级组件的 Angular 注入器。      

***这么做的理由：***       

* Angular 注入器是层次化的。      
* 在顶层组件提供服务时，该服务实例在所有子组件中可见并共享。    
* 服务是共享方法或状态的理想载体。      
* 当不同的两个组件需要一个服务的不同的实例时，上面的方法这就不理想了。在这种情况下，对于需要崭新和单独服务实例的组件，最好在组件级提供服务。       

### **4. 使用 @Injectable() 类装饰器**    

* 坚持当使用类型作为令牌来注入服务的依赖时，使用@Injectable()类装饰器，而非@Inject()参数装饰器。     

***这么做的理由：***       

* Angular 的 DI 机制会根据服务的构造函数参数的声明类型来解析服务的所有依赖。        
* 当服务只接受类型令牌相关的依赖时，比起在每个构造函数参数上使用@Inject()，@Injectable()的语法简洁多了。      

不好的写法：      
```
# app/heroes/shared/hero-arena.service.ts
export class HeroArena {
  constructor(
      @Inject(HeroService) private heroService: HeroService,
      @Inject(Http) private http: Http) {}
}
```
好的写法：   
```
@Injectable()
export class HeroArena {
  constructor(
    private heroService: HeroService,
    private http: Http) {}
}
```

----------

## **八、数据服务**      

### **1. 通过服务与Web服务器交互**      

* 坚持把数据操作和与数据交互的逻辑重构到服务里。    
* 坚持让数据服务来负责 XHR 调用、本地储存、内存储存或者其它数据操作。      

***这么做的理由：***        

* 组件的职责是为视图展示或收集信息。它不应该关心如何获取数据，它只需要知道向谁请求数据。把如何获取数据的逻辑移动到数据服务里，简化了组件，让其聚焦于视图。         
* 在测试使用数据服务的组件时，可以让数据调用更容易被测试（模拟或者真实）。     
* 数据管理的详情，比如头信息、方法、缓存、错误处理和重试逻辑，不是组件和其它的数据消费者应该关心的事情。    
* 数据服务应该封装这些细节。这样，在服务内部修改细节，就不会影响到它的消费者。并且更容易通过实现一个模拟服务来对消费者进行测试。   

---------

## **九、生命周期钩子**    

使用生命周期钩子来介入到 Angular 暴露的重要事件里。        

### **1. 实现生命周期钩子接口**     

* 坚持实现生命周期钩子接口。       

***这么做的理由：***        

* 如果使用强类型的方法签名，编译器和编辑器可以帮你揪出拼写错误。    

不好的写法：    
```
# app/heroes/shared/hero-button/hero-button.component.ts
@Component({
  selector: 'toh-hero-button',
  template: `<button>OK<button>`
})
export class HeroButtonComponent {
  onInit() { // misspelled
    console.log('The component is initialized');
  }
}
```
好的写法：     
```
@Component({
  selector: 'toh-hero-button',
  template: `<button>OK</button>`
})
export class HeroButtonComponent implements OnInit {
  ngOnInit() {
    console.log('The component is initialized');
  }
}
```
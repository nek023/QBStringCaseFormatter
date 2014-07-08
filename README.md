# QBStringCaseFormatter
A string formatter to convert camel-case string to snake-case string, and vice versa.


## Usage
```
QBStringCaseFormatter *formatter = [QBStringCaseFormatter new];

NSLog(@"camel-case string: %@", [formatter camelCaseStringFromSnakeCaseString:@"hoge_piyo"]);
NSLog(@"snake-case string: %@", [formatter snakeCaseStringFromCamelCaseString:@"HogePiyo"]);
```


## Author
Katsuma Tanaka, questbeat@gmail.com


## License
QBStringCaseFormatter is available under the MIT license. See the LICENSE file for more info.


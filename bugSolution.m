The solution involves avoiding direct memory manipulation of the C string once it's been used to create an `NSString` object. Instead, use methods that are safer and handle memory management automatically:

```objectivec
NSString *objCString = [NSString stringWithUTF8String:"Hello, world!"];
NSLog(@"%@", objCString);
// No need to free cString; NSString handles memory management.
```

Alternatively, if you must work with a dynamically allocated C string, consider using `strdup` to create a copy before passing it to `NSString`:

```objectivec
char *cString = strdup("Hello, world!");
NSString *objCString = [NSString stringWithUTF8String:cString];
NSLog(@"%@", objCString);
free(cString); // Safe to free here because a copy was made.
```
This ensures that even after freeing the original C string, `objCString` still has a valid memory address. However, it’s generally better to avoid this situation by simply using string literals directly in the `NSString` creation methods as shown in the first solution.
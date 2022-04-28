# ncd_finalizing_project
a simple project to become near certificated developer

[Loom Video Link](https://www.loom.com/embed/2b1877ab20684c1fbd2dc9e4473d9b2c)

to provide this, I use PersistentMap collection which seems pretty convenient with my goal by only accessing the needed storage area.
It also gives some encapsulation. You wont be able reach phrases you dont know

First i suggest to read basics of near at https://github.com/Learn-NEAR/starter--near-sdk-as
 
My project has two public functions

one is adding an entry to dictionary phrase
```ts
export function add_to_dictionary(phrase: string, entry:string): string {
  const sender = Context.sender
  
  return add_to_dict(phrase,entry,sender)
}

```
you can call it with a phrase and an entry parameter
```
 near call $CONTRACT add_to_dictionary '{"phrase": "<some_phrase>","entry": "<some_entry>"}' --accountId <some_account_id>
```

other one is viewing entries of a phrase at dictionary

```ts
export function get_dict_element(phrase:string): string{
...
}
```
you can call it with phrase you are looking for
```
near view $CONTRACT get_dict_element '{"phrase": "<phrase>"}
```

also i modified package.json like 
```
  "scripts": {
    ...
    "build:release": "asb && near dev-deploy ./build/release/simple.wasm",
    ...
  }
```
so you can just ``` yarn build:release ``` and it will compile and deploy your code.


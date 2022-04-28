import { logging, PersistentMap, Context, PersistentVector } from "near-sdk-as"
import {Dictionary_Element, Entry} from "./model"


let dict = new PersistentMap<string, Dictionary_Element>("pmap");

// it directs the calls with predecessor 
export function add_to_dictionary(phrase: string, entry:string): string {
  const sender = Context.sender
  
  return add_to_dict(phrase,entry,sender)
}

function add_to_dict(phrase: string, entry:string,sender: string): string{

  const formatted_entry = sender+"@"+entry
  const new_entry = new Entry(formatted_entry)

  if(dict.contains(phrase)){
    logging.log("does contaion the phrase")
    
    let dict_element = dict.get(phrase, null)

    if(dict_element===null)
      return "error occured at add_to_dict 1"
    
    dict_element.entries.push(new_entry)
    var entries = dict_element.entries
    dict.delete(phrase)
    var new_dir = new Dictionary_Element(phrase,entries)
    dict.set(phrase,new_dir)
  }else{
    logging.log("does not contain the phrase")

    let entry_list = new PersistentVector<Entry>("pvec"+phrase)
    entry_list.push(new_entry)

    let dict_element = new Dictionary_Element(phrase,entry_list)

    dict.set(phrase,dict_element)
  }

  return get_dict_element(phrase)
}

export function get_dict_element(phrase:string): string{
  logging.log("in get dict elements")

  let return_string = phrase +" page is empty"
  let dict_el = dict.get(phrase)

  if(dict_el===null)
    return return_string
  else 
    return_string=dict_el.print_dict(), "an error happened while printing dict"

    logging.log(return_string)
    return return_string
}

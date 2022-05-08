import { logging, PersistentVector } from "near-sdk-as"

@nearBindgen
export class Dictionary_Element{
    phrase:string // index name
    entries: PersistentVector<Entry>
    constructor(phrase:string, entries: PersistentVector<Entry>){
        this.phrase=phrase
        this.entries=entries
    }
    print_dict(): string { // returns the all entries belongs to the given phrase
        let str ="phrase: "+this.phrase     // concats phrase and entries
        for(let i= 0; i< this.entries.length;i++) { 
            let entry = this.entries[i]
            str+= "   \n  "+entry.comment+"  \n\t\t\t  by user: "+entry.user
        }

        return str
    }
}

@nearBindgen
export class Entry{
    user:string
    comment:string
    constructor(entry:string){
        // derives username and comment from entry string
        let index = entry.indexOf("@");  // finds location of first @
        this.user = entry.substr(0, index); // gets the username part
        this.comment = entry.substr(index + 1);  // gets the comment part
        
    }
}
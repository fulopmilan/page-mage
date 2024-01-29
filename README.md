# Page Mage

a highly illegal app that takes possibly copyrighted books for an input, also give it a prompt, then it converts them into answers that are related to the content of the given book.

## Installation

### server setup from main folder
```
cd server
npm i
npm start
```

### client setup from main folder
```
//generate the files for platforms
flutter create client --platforms=android,windows,linux,web,macos,ios
cd client
flutter run
```

## Usage

### how to create vectors for a new book
```
cd vector_maker
//open indexing.js
//paste in the book content in the "text" constant
node indexing.js
//if everything went well, you got 2 new files. copy them ("docstore.json" and "faiss.index")
cd ..
cd server/src/data/vectors
//create a new folder there, such as "atomic-habits" or "life-story-of-charlotte" and paste those 2 files in
//in server/data/books.ts, make sure to create your own books with the correct path(!!!)
``` 
import { OpenAIEmbeddings } from "langchain/embeddings/openai";
import { FaissStore } from "langchain/vectorstores/faiss";
import { OpenAI } from "langchain/llms/openai";
import { RetrievalQAChain, loadQAStuffChain } from "langchain/chains";

import books from "./data/books";

async function SendAI(prompt: String, bookId: number) {
    const embeddings = new OpenAIEmbeddings();
    const vectorStore = await FaissStore.load(`./src/data/vectors/${books[bookId - 1].path}`, embeddings);

    const model = new OpenAI({ temperature: 0 });

    const chain = new RetrievalQAChain({
        combineDocumentsChain: loadQAStuffChain(model),
        retriever: vectorStore.asRetriever(),
        returnSourceDocuments: true,
    });

    const res = await chain.call({
        query: prompt,
    });

    return res.text;
}

export default SendAI;
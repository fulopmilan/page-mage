// src/index.js
import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";

import books from "./src/data/books";
import SendAI from "./src/sendAi";

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 5000;

app.use(express.urlencoded({ extended: true }));

app.post("/api/getAIMessage", async (req: Request, res: Response) => {
    const { userMessage, bookId } = req.body;
    const answer = await SendAI(userMessage, parseInt(bookId));

    res.send(answer);
});

app.post("/api/getBookListData", (req: Request, res: Response) => {
    res.send(books);
});

app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});
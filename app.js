import dotenv from "dotenv";
dotenv.config();

import express from "express";
import aboutSectionsRouter from "./routes/aboutSections.js";



const app = express();
app.use(express.json());

app.use("/api/about-sections", aboutSectionsRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
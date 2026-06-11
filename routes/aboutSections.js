import { Router } from "express";
import { db } from "../src/db/instance.js";
import { aboutSections } from "../src/db/schema.js";
import { eq } from "drizzle-orm";

const router = Router();


router.get("/", async (req, res) => {
  const all = await db.select().from(aboutSections);
  res.json(all);
});


router.get("/:id", async (req, res) => {
  const result = await db
    .select()
    .from(aboutSections)
    .where(eq(aboutSections.id, req.params.id));

  if (!result.length) return res.status(404).json({ error: "Not found" });
  res.json(result[0]);
});


router.post("/", async (req, res) => {
  try {
    const { slug, title, content } = req.body;
  const inserted = await db
    .insert(aboutSections)
    .values({ slug, title, content })
    .returning();
  res.status(201).json(inserted[0]);
    
  } catch (err) {
  console.error(err);  // change this from err.message to just err
  res.status(500).json({ error: err.message, detail: err.detail, code: err.code });
}
  
});


router.put("/:id", async (req, res) => {
  const { slug, title, content } = req.body;
  const updated = await db
    .update(aboutSections)
    .set({ slug, title, content })
    .where(eq(aboutSections.id, req.params.id))
    .returning();

  if (!updated.length) return res.status(404).json({ error: "Not found" });
  res.json(updated[0]);
});


router.delete("/:id", async (req, res) => {
  const deleted = await db
    .delete(aboutSections)
    .where(eq(aboutSections.id, req.params.id))
    .returning();

  if (!deleted.length) return res.status(404).json({ error: "Not found" });
  res.json({ message: "Deleted", data: deleted[0] });
});

export default router;
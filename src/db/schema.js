import {
  pgTable,
  pgEnum,
  uuid,
  varchar,
  text,
  timestamp,
  date,
  integer,
} from "drizzle-orm/pg-core";

export const mediaTypeEnum = pgEnum("media_type", [
  "image",
  "pdf",
  "video",
  "other",
]);

export const staffTypeEnum = pgEnum("staff_type", [
  "faculty",
  "officer",
  "staff",
]);

export const updateCategoryEnum = pgEnum("update_category", [
  "news_event",
  "activity",
  "circular",
  "publication",
  "research",
  "press_release",
]);

export const videoCategoryEnum = pgEnum("video_category", [
  "podcast",
  "general",
]);

export const downloadTypeEnum = pgEnum("download_type", ["pdf", "link"]);

export const media = pgTable("media", {
  id: uuid("id").defaultRandom().primaryKey(),

  fileName: varchar("file_name", { length: 255 }).notNull(),

  fileUrl: text("file_url").notNull(),

  fileType: mediaTypeEnum("file_type").notNull(),

  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export const directorMessages = pgTable("director_messages", {
  id: uuid("id").defaultRandom().primaryKey(),

  message: text("message").notNull(),

  photoId: uuid("photo_id").references(() => media.id),

  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export const aboutSections = pgTable("about_sections", {
  id: uuid("id").defaultRandom().primaryKey(),

  slug: varchar("slug", { length: 100 }).notNull(),

  title: varchar("title", { length: 255 }).notNull(),

  content: text("content").notNull(),
});

export const partners = pgTable("partners", {
  id: uuid("id").defaultRandom().primaryKey(),

  name: varchar("name", { length: 255 }).notNull(),

  websiteUrl: text("website_url").notNull(),

  logoId: uuid("logo_id")
    .references(() => media.id)
    .notNull(),

  sortOrder: integer("sort_order").default(0),
});

export const organizationStructures = pgTable("organization_structures", {
  id: uuid("id").defaultRandom().primaryKey(),

  pdfId: uuid("pdf_id")
    .references(() => media.id)
    .notNull(),
});

export const infrastructures = pgTable("infrastructures", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  description: text("description").notNull(),
});

export const infrastructureImages = pgTable("infrastructure_images", {
  id: uuid("id").defaultRandom().primaryKey(),

  infrastructureId: uuid("infrastructure_id")
    .references(() => infrastructures.id)
    .notNull(),

  imageId: uuid("image_id")
    .references(() => media.id)
    .notNull(),
});

export const accreditations = pgTable("accreditations", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  description: text("description").notNull(),

  benefits: text("benefits"),

  logoId: uuid("logo_id").references(() => media.id),

  certificateId: uuid("certificate_id").references(() => media.id),
});

export const staffMembers = pgTable("staff_members", {
  id: uuid("id").defaultRandom().primaryKey(),

  name: varchar("name", { length: 255 }).notNull(),

  designation: varchar("designation", {
    length: 255,
  }).notNull(),

  type: staffTypeEnum("type").notNull(),

  photoId: uuid("photo_id").references(() => media.id),

  email: varchar("email", { length: 255 }),

  phone: varchar("phone", { length: 50 }),
});

export const sections = pgTable("sections", {
  id: uuid("id").defaultRandom().primaryKey(),

  name: varchar("name", { length: 255 }).notNull(),

  content: text("content").notNull(),
});

export const sectionImages = pgTable("section_images", {
  id: uuid("id").defaultRandom().primaryKey(),

  sectionId: uuid("section_id")
    .references(() => sections.id)
    .notNull(),

  imageId: uuid("image_id")
    .references(() => media.id)
    .notNull(),
});

export const trainingCalendars = pgTable("training_calendars", {
  id: uuid("id").defaultRandom().primaryKey(),

  year: integer("year").notNull(),

  pdfId: uuid("pdf_id")
    .references(() => media.id)
    .notNull(),
});

export const programmes = pgTable("programmes", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  description: text("description"),

  startDate: date("start_date").notNull(),

  endDate: date("end_date").notNull(),

  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export const programmeImages = pgTable("programme_images", {
  id: uuid("id").defaultRandom().primaryKey(),

  programmeId: uuid("programme_id")
    .references(() => programmes.id)
    .notNull(),

  imageId: uuid("image_id")
    .references(() => media.id)
    .notNull(),
});

export const programmeDocuments = pgTable("programme_documents", {
  id: uuid("id").defaultRandom().primaryKey(),

  programmeId: uuid("programme_id")
    .references(() => programmes.id)
    .notNull(),

  mediaId: uuid("media_id")
    .references(() => media.id)
    .notNull(),
});

export const trainingMaterials = pgTable("training_materials", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  description: text("description"),
});

export const trainingReports = pgTable("training_reports", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  description: text("description"),

  pdfId: uuid("pdf_id").references(() => media.id),
});

export const updates = pgTable("updates", {
  id: uuid("id").defaultRandom().primaryKey(),

  category: updateCategoryEnum("category").notNull(),

  title: varchar("title", { length: 255 }).notNull(),

  content: text("content"),

  publishDate: date("publish_date"),

  pdfId: uuid("pdf_id").references(() => media.id),
});

export const updateImages = pgTable("update_images", {
  id: uuid("id").defaultRandom().primaryKey(),

  updateId: uuid("update_id")
    .references(() => updates.id)
    .notNull(),

  imageId: uuid("image_id")
    .references(() => media.id)
    .notNull(),
});

export const videos = pgTable("videos", {
  id: uuid("id").defaultRandom().primaryKey(),

  category: videoCategoryEnum("category").notNull(),

  title: varchar("title", { length: 255 }).notNull(),

  youtubeUrl: text("youtube_url").notNull(),

  publishDate: date("publish_date"),
});

export const photoAlbums = pgTable("photo_albums", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  eventDate: date("event_date"),
});

export const albumImages = pgTable("album_images", {
  id: uuid("id").defaultRandom().primaryKey(),

  albumId: uuid("album_id")
    .references(() => photoAlbums.id)
    .notNull(),

  imageId: uuid("image_id")
    .references(() => media.id)
    .notNull(),
});

export const resources = pgTable("resources", {
  id: uuid("id").defaultRandom().primaryKey(),

  category: varchar("category", {
    length: 100,
  }).notNull(),

  title: varchar("title", { length: 255 }).notNull(),

  content: text("content"),
});

export const resourceFiles = pgTable("resource_files", {
  id: uuid("id").defaultRandom().primaryKey(),

  resourceId: uuid("resource_id")
    .references(() => resources.id)
    .notNull(),

  pdfId: uuid("pdf_id")
    .references(() => media.id)
    .notNull(),
});

export const successStories = pgTable("success_stories", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  content: text("content"),
});

export const downloads = pgTable("downloads", {
  id: uuid("id").defaultRandom().primaryKey(),

  title: varchar("title", { length: 255 }).notNull(),

  type: downloadTypeEnum("type").notNull(),

  externalUrl: text("external_url"),

  pdfId: uuid("pdf_id").references(() => media.id),
});

export const siteSettings = pgTable("site_settings", {
  id: uuid("id").defaultRandom().primaryKey(),

  siteTitle: varchar("site_title", { length: 255 }),

  address: text("address"),

  phone: varchar("phone", { length: 50 }),

  email: varchar("email", { length: 255 }),

  mapEmbedCode: text("map_embed_code"),

  grievanceContent: text("grievance_content"),
});

export const feedbackSubmissions = pgTable("feedback_submissions", {
  id: uuid("id").defaultRandom().primaryKey(),

  name: varchar("name", { length: 255 }).notNull(),

  email: varchar("email", { length: 255 }).notNull(),

  subject: varchar("subject", {
    length: 255,
  }).notNull(),

  message: text("message").notNull(),

  createdAt: timestamp("created_at").defaultNow().notNull(),
});

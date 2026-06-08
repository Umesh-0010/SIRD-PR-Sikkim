CREATE TYPE "public"."download_type" AS ENUM('pdf', 'link');--> statement-breakpoint
CREATE TYPE "public"."media_type" AS ENUM('image', 'pdf', 'video', 'other');--> statement-breakpoint
CREATE TYPE "public"."staff_type" AS ENUM('faculty', 'officer', 'staff');--> statement-breakpoint
CREATE TYPE "public"."update_category" AS ENUM('news_event', 'activity', 'circular', 'publication', 'research', 'press_release');--> statement-breakpoint
CREATE TYPE "public"."video_category" AS ENUM('podcast', 'general');--> statement-breakpoint
CREATE TABLE "about_sections" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"slug" varchar(100) NOT NULL,
	"title" varchar(255) NOT NULL,
	"content" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "accreditations" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text NOT NULL,
	"benefits" text,
	"logo_id" uuid,
	"certificate_id" uuid
);
--> statement-breakpoint
CREATE TABLE "album_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"album_id" uuid NOT NULL,
	"image_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "director_messages" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"message" text NOT NULL,
	"photo_id" uuid,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "downloads" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"type" "download_type" NOT NULL,
	"external_url" text,
	"pdf_id" uuid
);
--> statement-breakpoint
CREATE TABLE "feedback_submissions" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"subject" varchar(255) NOT NULL,
	"message" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "infrastructure_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"infrastructure_id" uuid NOT NULL,
	"image_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "infrastructures" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "media" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"file_name" varchar(255) NOT NULL,
	"file_url" text NOT NULL,
	"file_type" "media_type" NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "organization_structures" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"pdf_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "partners" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" varchar(255) NOT NULL,
	"website_url" text NOT NULL,
	"logo_id" uuid NOT NULL,
	"sort_order" integer DEFAULT 0
);
--> statement-breakpoint
CREATE TABLE "photo_albums" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"event_date" date
);
--> statement-breakpoint
CREATE TABLE "programme_documents" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"programme_id" uuid NOT NULL,
	"media_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "programme_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"programme_id" uuid NOT NULL,
	"image_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "programmes" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text,
	"start_date" date NOT NULL,
	"end_date" date NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "resource_files" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"resource_id" uuid NOT NULL,
	"pdf_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "resources" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"category" varchar(100) NOT NULL,
	"title" varchar(255) NOT NULL,
	"content" text
);
--> statement-breakpoint
CREATE TABLE "section_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"section_id" uuid NOT NULL,
	"image_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "sections" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" varchar(255) NOT NULL,
	"content" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "site_settings" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"site_title" varchar(255),
	"address" text,
	"phone" varchar(50),
	"email" varchar(255),
	"map_embed_code" text,
	"grievance_content" text
);
--> statement-breakpoint
CREATE TABLE "staff_members" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" varchar(255) NOT NULL,
	"designation" varchar(255) NOT NULL,
	"type" "staff_type" NOT NULL,
	"photo_id" uuid,
	"email" varchar(255),
	"phone" varchar(50)
);
--> statement-breakpoint
CREATE TABLE "success_stories" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"content" text
);
--> statement-breakpoint
CREATE TABLE "training_calendars" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"year" integer NOT NULL,
	"pdf_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "training_materials" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text
);
--> statement-breakpoint
CREATE TABLE "training_reports" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text,
	"pdf_id" uuid
);
--> statement-breakpoint
CREATE TABLE "update_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"update_id" uuid NOT NULL,
	"image_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE "updates" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"category" "update_category" NOT NULL,
	"title" varchar(255) NOT NULL,
	"content" text,
	"publish_date" date,
	"pdf_id" uuid
);
--> statement-breakpoint
CREATE TABLE "videos" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"category" "video_category" NOT NULL,
	"title" varchar(255) NOT NULL,
	"youtube_url" text NOT NULL,
	"publish_date" date
);
--> statement-breakpoint
ALTER TABLE "accreditations" ADD CONSTRAINT "accreditations_logo_id_media_id_fk" FOREIGN KEY ("logo_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "accreditations" ADD CONSTRAINT "accreditations_certificate_id_media_id_fk" FOREIGN KEY ("certificate_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "album_images" ADD CONSTRAINT "album_images_album_id_photo_albums_id_fk" FOREIGN KEY ("album_id") REFERENCES "public"."photo_albums"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "album_images" ADD CONSTRAINT "album_images_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "director_messages" ADD CONSTRAINT "director_messages_photo_id_media_id_fk" FOREIGN KEY ("photo_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "downloads" ADD CONSTRAINT "downloads_pdf_id_media_id_fk" FOREIGN KEY ("pdf_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "infrastructure_images" ADD CONSTRAINT "infrastructure_images_infrastructure_id_infrastructures_id_fk" FOREIGN KEY ("infrastructure_id") REFERENCES "public"."infrastructures"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "infrastructure_images" ADD CONSTRAINT "infrastructure_images_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "organization_structures" ADD CONSTRAINT "organization_structures_pdf_id_media_id_fk" FOREIGN KEY ("pdf_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "partners" ADD CONSTRAINT "partners_logo_id_media_id_fk" FOREIGN KEY ("logo_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "programme_documents" ADD CONSTRAINT "programme_documents_programme_id_programmes_id_fk" FOREIGN KEY ("programme_id") REFERENCES "public"."programmes"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "programme_documents" ADD CONSTRAINT "programme_documents_media_id_media_id_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "programme_images" ADD CONSTRAINT "programme_images_programme_id_programmes_id_fk" FOREIGN KEY ("programme_id") REFERENCES "public"."programmes"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "programme_images" ADD CONSTRAINT "programme_images_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "resource_files" ADD CONSTRAINT "resource_files_resource_id_resources_id_fk" FOREIGN KEY ("resource_id") REFERENCES "public"."resources"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "resource_files" ADD CONSTRAINT "resource_files_pdf_id_media_id_fk" FOREIGN KEY ("pdf_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "section_images" ADD CONSTRAINT "section_images_section_id_sections_id_fk" FOREIGN KEY ("section_id") REFERENCES "public"."sections"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "section_images" ADD CONSTRAINT "section_images_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "staff_members" ADD CONSTRAINT "staff_members_photo_id_media_id_fk" FOREIGN KEY ("photo_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "training_calendars" ADD CONSTRAINT "training_calendars_pdf_id_media_id_fk" FOREIGN KEY ("pdf_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "training_reports" ADD CONSTRAINT "training_reports_pdf_id_media_id_fk" FOREIGN KEY ("pdf_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "update_images" ADD CONSTRAINT "update_images_update_id_updates_id_fk" FOREIGN KEY ("update_id") REFERENCES "public"."updates"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "update_images" ADD CONSTRAINT "update_images_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "updates" ADD CONSTRAINT "updates_pdf_id_media_id_fk" FOREIGN KEY ("pdf_id") REFERENCES "public"."media"("id") ON DELETE no action ON UPDATE no action;
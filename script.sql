CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" varchar(150) NOT NULL,
    "ProductVersion" varchar(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "Courses" (
    "Id" serial NOT NULL,
    "Title" text NULL,
    "Credits" integer NOT NULL,
    CONSTRAINT "PK_Courses" PRIMARY KEY ("Id")
);

CREATE TABLE "Students" (
    "Id" serial NOT NULL,
    "LastName" text NULL,
    "MiddleName" text NULL,
    "FirstName" text NULL,
    "EnrollmentDate" timestamp without time zone NOT NULL,
    CONSTRAINT "PK_Students" PRIMARY KEY ("Id")
);

CREATE TABLE "Enrollment" (
    "Id" serial NOT NULL,
    "CourseId" integer NOT NULL,
    "StudentId" integer NOT NULL,
    "Grade" character(1) NOT NULL,
    CONSTRAINT "PK_Enrollment" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Enrollment_Courses_CourseId" FOREIGN KEY ("CourseId") REFERENCES "Courses" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Enrollment_Students_StudentId" FOREIGN KEY ("StudentId") REFERENCES "Students" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_Enrollment_CourseId" ON "Enrollment" ("CourseId");

CREATE INDEX "IX_Enrollment_StudentId" ON "Enrollment" ("StudentId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20180710112004_InitialCreate', '2.1.1-rtm-30846');



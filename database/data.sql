USE Mosaic;

-- Workspaces
INSERT INTO Workspace (WorkspaceName, Description) VALUES
    ('Personal',      'Personal projects, hobbies, and day-to-day notes'),
    ('Work',          'Professional tasks, meetings, and career resources'),
    ('School',        'Academic coursework, research, and study materials'),
    ('Side Projects', 'Freelance work and passion projects outside of the main job');

-- Content types
INSERT INTO ContentType (TypeName) VALUES
    ('Note'),
    ('PDF'),
    ('Image'),
    ('AudioVideo');

-- Which content types each workspace supports (all four support all types)
INSERT INTO Workspace_ContentType (WorkspaceID, ContentTypeID) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4),
    (2, 1), (2, 2), (2, 3), (2, 4),
    (3, 1), (3, 2), (3, 3), (3, 4),
    (4, 1), (4, 2), (4, 3), (4, 4);

-- Tags per workspace (TagIDs: Personal 1-5, Work 6-10, School 11-15, Side Projects 16-20)
INSERT INTO Tag (WorkspaceID, Keyword, HexCode) VALUES
    (1, 'Creativity',        '#F4A261'),
    (1, 'Mindfulness',       '#A8DADC'),
    (1, 'Journaling',        '#E9C46A'),
    (1, 'Self-Improvement',  '#264653'),
    (1, 'Travel',            '#2A9D8F'),
    (2, 'Innovation',        '#6A0572'),
    (2, 'Leadership',        '#1D3557'),
    (2, 'Productivity',      '#457B9D'),
    (2, 'Strategy',          '#E63946'),
    (2, 'Collaboration',     '#A8DADC'),
    (3, 'Research',          '#2B2D42'),
    (3, 'Critical Thinking', '#8D99AE'),
    (3, 'STEM',              '#EF233C'),
    (3, 'Literature',        '#D62828'),
    (3, 'Problem Solving',   '#F77F00'),
    (4, 'Entrepreneurship',  '#606C38'),
    (4, 'Design Thinking',   '#283618'),
    (4, 'Storytelling',      '#DDA15E'),
    (4, 'Tech',              '#BC6C25'),
    (4, 'Branding',          '#FEFAE0');

-- Content (ContentIDs 1-4 Personal, 5-8 Work, 9-12 School, 13-16 Side Projects)
-- Notes use TextContent; PDFs, Images, and AudioVideo use FilePath
INSERT INTO Content (WorkspaceID, ContentTypeID, Name, TextContent, FilePath, Description) VALUES
    (1, 1, 'Morning Routine Ideas',        'Wake up at 6am, meditate 10 min, journal 15 min, review goals.', NULL,                                    'Daily morning routine brainstorm'),
    (1, 3, 'Vision Board 2025',            NULL,                                                              '/files/personal/vision_board_2025.jpg', 'Annual vision board image'),
    (1, 4, 'Mindfulness Podcast Ep12',     NULL,                                                              '/files/personal/mindfulness_ep12.mp3',  'Episode on building daily habits'),
    (1, 2, 'Travel Bucket List',           NULL,                                                              '/files/personal/travel_bucket_list.pdf','Countries and cities to visit'),
    (2, 1, 'Q3 Strategy Notes',            'Focus areas: market expansion, team upskilling, OKR alignment.', NULL,                                    'Notes from Q3 planning session'),
    (2, 2, 'Innovation Report 2025',       NULL,                                                              '/files/work/innovation_report_2025.pdf','Annual innovation landscape PDF'),
    (2, 4, 'Leadership Webinar Recap',     NULL,                                                              '/files/work/leadership_webinar.mp4',    'Recording of external leadership talk'),
    (2, 3, 'Team Org Chart',               NULL,                                                              '/files/work/org_chart.png',             'Current department structure'),
    (3, 1, 'Thesis Outline',               'Chapter 1: Intro, Chapter 2: Literature Review, Chapter 3: Methodology.', NULL,                           'Draft outline for senior thesis'),
    (3, 2, 'Research Paper - ML Ethics',   NULL,                                                              '/files/school/ml_ethics_paper.pdf',    'Published paper on AI ethics'),
    (3, 3, 'Lab Diagram - Cell Structure', NULL,                                                              '/files/school/cell_structure.png',     'Biology lab visual aid'),
    (3, 4, 'Lecture - ECON 301',           NULL,                                                              '/files/school/econ301_lecture.mp4',    'Guest lecture on macroeconomics'),
    (4, 1, 'App Concept Notes',            'Idea: habit tracker that adapts goals weekly using AI. MVP features listed below.', NULL,                  'Early brainstorm for app idea'),
    (4, 2, 'Branding Guide Draft',         NULL,                                                              '/files/sideprojects/branding_guide.pdf','Color palette, fonts, and logo rules'),
    (4, 3, 'Logo Mockup v1',               NULL,                                                              '/files/sideprojects/logo_v1.png',       'First logo iteration'),
    (4, 4, 'Pitch Deck Walkthrough',       NULL,                                                              '/files/sideprojects/pitch_walkthrough.mp4','Recorded run-through of investor pitch');

-- Subtype tables
INSERT INTO Note (ContentID) VALUES (1), (5), (9), (13);

INSERT INTO PDF (ContentID) VALUES (4), (6), (10), (14);

INSERT INTO Image (ContentID, Width, Height) VALUES
    (2,  1920, 1080),
    (8,  2480, 3508),
    (11, 1280,  960),
    (15, 2000, 2000);

INSERT INTO AudioVideo (ContentID, DurationSeconds) VALUES
    (3,  1440),
    (7,  5400),
    (12, 3600),
    (16, 1200);

-- File metadata for all file-based content
INSERT INTO File_Metadata (ContentID, FileSize, FileExtension, ExtractedTextAvailable) VALUES
    (2,    2048000, 'jpg',  FALSE),
    (3,   48000000, 'mp3',  FALSE),
    (4,     512000, 'pdf',  TRUE),
    (6,    3200000, 'pdf',  TRUE),
    (7,  750000000, 'mp4',  FALSE),
    (8,     204800, 'png',  FALSE),
    (10,   1024000, 'pdf',  TRUE),
    (11,    358400, 'png',  FALSE),
    (12, 500000000, 'mp4',  FALSE),
    (14,   2560000, 'pdf',  TRUE),
    (15,    102400, 'png',  FALSE),
    (16, 300000000, 'mp4',  FALSE);

-- Collections
INSERT INTO Collection (WorkspaceID, CollectionName, Description) VALUES
    (1, 'YouTube Content',        'Videos and notes for personal channel ideas'),
    (1, 'Self-Help Reading List', 'Books and PDFs on personal growth'),
    (2, 'Leadership Resources',   'Webinars, reports, and notes on leading teams'),
    (2, 'Q3 Planning',            'All assets related to Q3 strategic planning'),
    (3, 'Thesis Research',        'Papers, notes, and references for the thesis'),
    (3, 'Lecture Archive',        'Recorded lectures and class notes'),
    (4, 'Investor Pitch Pack',    'Everything needed for the funding pitch'),
    (4, 'Brand Assets',           'Logos, branding guides, and design files');

-- Collection contents (CollectionIDs 1-8 match insertion order above)
INSERT INTO Collection_Content (CollectionID, ContentID) VALUES
    (1, 3),
    (1, 1),
    (2, 4),
    (2, 2),
    (3, 7),
    (3, 6),
    (3, 5),
    (4, 5),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 12),
    (6, 9),
    (7, 16),
    (7, 14),
    (7, 13),
    (8, 15),
    (8, 14);

-- Content tags
INSERT INTO Content_Tag (ContentID, TagID) VALUES
    (1,  1),
    (1,  2),
    (1,  3),
    (2,  1),
    (2,  4),
    (3,  2),
    (3,  4),
    (4,  5),
    (5,  8),
    (5,  9),
    (6,  6),
    (6,  9),
    (7,  7),
    (7,  10),
    (8,  10),
    (9,  11),
    (9,  12),
    (10, 11),
    (10, 13),
    (11, 13),
    (12, 15),
    (13, 16),
    (13, 17),
    (13, 19),
    (14, 20),
    (14, 18),
    (15, 20),
    (15, 17),
    (16, 16),
    (16, 18);

-- Saved searches
INSERT INTO Saved_Search (WorkspaceID, SearchName, SearchQuery) VALUES
    (1, 'Mindfulness content',   'SELECT * FROM Content WHERE ContentID IN (SELECT ContentID FROM Content_Tag WHERE TagID = 2)'),
    (2, 'Innovation & Strategy', 'SELECT * FROM Content WHERE ContentID IN (SELECT ContentID FROM Content_Tag WHERE TagID IN (6, 9))'),
    (3, 'Research papers',       'SELECT * FROM Content WHERE ContentTypeID = 2 AND WorkspaceID = 3'),
    (4, 'Brand and design',      'SELECT * FROM Content WHERE ContentID IN (SELECT ContentID FROM Content_Tag WHERE TagID IN (17, 20))');

-- Snapshots
INSERT INTO Snapshot (WorkspaceID, SnapshotName, SnapshotData) VALUES
    (1, 'Personal - June 2025',      '{"contentCount": 4, "collections": ["YouTube Content", "Self-Help Reading List"], "tagCount": 5}'),
    (2, 'Work - Q3 Kickoff',         '{"contentCount": 4, "collections": ["Leadership Resources", "Q3 Planning"], "tagCount": 5}'),
    (3, 'School - Semester Start',   '{"contentCount": 4, "collections": ["Thesis Research", "Lecture Archive"], "tagCount": 5}'),
    (4, 'Side Projects - MVP Stage', '{"contentCount": 4, "collections": ["Investor Pitch Pack", "Brand Assets"], "tagCount": 5}');

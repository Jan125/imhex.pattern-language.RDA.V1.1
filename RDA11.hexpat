import std.io;

struct FileTypeComponent_RDA11_Header {
    char RDA11Ident[256];
    u32 TotalEntries;
};

struct FileTypeComponent_RDA11_Entry {
    char EntryName[256];
    u32 AddressOfEntry;
    u32 EntryLength;
    u32 EntryLength2;
    u32 Unknown1;
    u32 Unknown2;

    char Binary[EntryLength] @ AddressOfEntry;

};

struct FileType_RDA11 {
    FileTypeComponent_RDA11_Header Header;
    FileTypeComponent_RDA11_Entry Entries[Header.TotalEntries];
};

FileType_RDA11 File_RDA11 @ 0x00;


// Extract files one-by-one:
// Click on wanted Binary->File->Export->Selection to file...

namespace conference;

entity Presenters {
  key ID: UUID;
  firstName: String;
  lastName: String;
  email: String;
  bio: String;
  presentations: Association to many Presentations on presentations.presenter = $self;
}

entity Presentations {
  key ID: UUID;
  title: String;
  abstract: String;
  type: String enum {
    talk;
    workshop;
    lightning;
  };
  duration: Integer;
  level: String enum {
    beginner;
    intermediate;
    advanced;
  };
  tags: array of String;
  status: String enum {
    draft;
    submitted;
    accepted;
    rejected;
  } default 'draft';
  presenter: Association to Presenters;
  createdAt: Timestamp @cds.on.insert: $now;
  modifiedAt: Timestamp @cds.on.insert: $now @cds.on.modify: $now;
}

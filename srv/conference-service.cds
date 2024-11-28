using { conference as db } from '../db/schema';

service ConferenceService {
  entity Presenters as projection on db.Presenters;
  entity Presentations as projection on db.Presentations;
}

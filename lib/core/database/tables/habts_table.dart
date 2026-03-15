const String habitsTableName = 'habits';
const String habitIdColumn = 'id';
const String habitTitleColumn = 'title';
const String habitCreatedAtColumn = 'created_at';
const String habitDescriptionColumn = 'description';

const String createHabtsTable =
    '''
      CREATE TABLE $habitsTableName (
        $habitIdColumn TEXT PRIMARY KEY,
        $habitTitleColumn TEXT NOT NULL,
        $habitCreatedAtColumn TEXT NOT NULL,
        $habitDescriptionColumn TEXT
      )
    ''';

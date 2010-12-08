ActiveRecord::Base.send(:extend, EricChapweske::InaccessibleAttributes)
ActiveRecord::Base.send(:include, EricChapweske::MassAssignmentWithExceptionOnUnsafeAttributes)
ActiveRecord::Migration.send(:extend, EricChapweske::MigrationWarning)

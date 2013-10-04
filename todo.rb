require_relative 'config/application'

if ARGV[0] == 'add'
  task_name = ARGV[1..-1].join(" ")
  t = Task.create(:name => task_name.humanize)

  puts Task.exists?(t.id) ? "Task  '#{t.name}' created" :  "Name can't be blank" 

elsif ARGV[0] == 'list'
  Task.all.each do |task|
     print "#{task.id}: "
     print task.completed? ? "[x]" : "[ ]"
     puts task.name
  end

elsif ARGV[0] == 'delete'
  task = Task.find_by_id(ARGV[1])
  if task
    Task.delete(task.id)
    puts "Task '#{task.name}' deleted"
  else
    puts "Task with id '#{ARGV[1]}' couldn't be found"
  end

elsif ARGV[0] == 'complete'
  task = Task.find(ARGV[1])
  task.completed = true
  task.save
  puts "Task '#{task.name}' completed"
end
  

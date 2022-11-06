local createJavaProject = function()
  local companyName = vim.fn.input('Enter company name: ')
  local projectName = vim.fn.input('Enter project name: ')
  print('Creating project ' .. projectName .. '...')
  os.execute("mvn archetype:generate -DgroupId=" ..
    companyName ..
    " -DartifactId=" .. projectName .. " -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false")
  print('Project created!')
end

local compileJavaProject = function()
  os.execute('mvn package')
  local projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  vim.cmd('FloatermNew! --wintype=split java -jar target/' .. projectName .. '-1.0-SNAPSHOT.jar')
end

local compilePythonProject = function()
  vim.cmd('FloatermNew! --wintype=split python3 %')
end

local compileCProject = function()
  local fileName = vim.fn.fnamemodify(vim.fn.expand('%'), ':t:r')
  os.execute('gcc -o ' .. fileName .. ' ' .. fileName .. '.c')
  vim.cmd('FloatermNew! --wintype=split ./' .. fileName)
end

CompileDebugCProject = function()
  local fileName = vim.fn.fnamemodify(vim.fn.expand('%'), ':t:r')
  os.execute('gcc -g -o ' .. fileName .. ' ' .. fileName .. '.c')
end

local compileProject = function()
  local fileType = vim.fn.expand('%:e')
  if fileType == 'java' then
    compileJavaProject()
  elseif fileType == 'py' then
    compilePythonProject()
  elseif fileType == 'c' then
    compileCProject()
  end
end

vim.api.nvim_create_user_command('CreateJavaProject', createJavaProject, {})
vim.api.nvim_create_user_command('CompileJavaProject', compileJavaProject, {})
vim.api.nvim_create_user_command('Compile', compileProject, {})

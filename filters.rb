# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  for candidate in candidates
    if id == candidate.id
      return candidate
    end
  end
  return nil
end
  
def experienced?(candidate)
  if candidate.years_of_experience >= 2
    return true
  else
    return false
  end
end

def qualified_languages?(candidate)
  if candidate.languages.include('Ruby' || 'Python')
    return true
  else
    return false
  end
end
  
def qualified_date?(candidate)
  if candidate.date_applied <= 15.days.ago.to_date
    return true
  else
    return false
  end
end

def qualified_candidates(candidates)
  qualified_array = []
  for candidate in candidates
    if experienced(candidate) && candidate.github_points >= 100 && qualified_languages(candidate) && qualified_date(candidate) && candidate.age >= 18
      qualified_array.push(candidate)
    end
  end
  return qualified_array
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate.years_of_experience, -candidate.github_points]}
end
  # More methods will go below
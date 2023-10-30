module MatchGenerator
  MATCH_ORDER = {
    4 => [
      [[1, 4], [2, 3]],
      [[2, 4], [3, 1]],
      [[3, 4], [1, 2]]
    ],
    5 => [
      [[1, 4], [2, 3]],
      [[2, 4], [3, 1]],
      [[3, 4], [1, 2]]
    ],
    6 => [
      [[1, 6], [2, 5], [3, 4]],
      [[2, 6], [3, 1], [4, 5]],
      [[3, 6], [4, 2], [5, 1]],
      [[4, 5], [5, 3], [1, 2]],
      [[5, 6], [1, 4], [2, 3]]
    ],
    7 => [
      [[1, 6], [2, 5], [3, 4]],
      [[2, 6], [3, 1], [4, 5]],
      [[3, 6], [4, 2], [5, 1]],
      [[4, 5], [5, 3], [1, 2]],
      [[5, 6], [1, 4], [2, 3]]
    ],
    8 => [
      [[1, 8], [2, 7], [3, 6], [4, 5]],
      [[2, 8], [3, 1], [4, 7], [5, 6]],
      [[3, 8], [4, 2], [5, 1], [6, 7]],
      [[4, 8], [5, 3], [6, 2], [7, 1]],
      [[5, 8], [6, 4], [7, 3], [1, 2]],
      [[6, 8], [7, 5], [1, 4], [2, 3]],
      [[7, 8], [1, 6], [2, 5], [3, 4]]
    ]
  }.freeze
  

  def generate_matches(competition, no_competitors)
    matches_order = MATCH_ORDER[no_competitors]
    start_date_time = Time.now + 1.day

    matches_order.each_with_index do |round, i|
      start_date_time = (start_date_time + 5.days).change(hour: 18, min: 0)

      round.each_with_index do |match, index|
        competitor1 = competition.competitors[match[0] - 1]
        competitor2 = competition.competitors[match[1] - 1]

        Match.create!(
          competition_id: competition.id,
          competitor1_id: competitor1.id,
          competitor2_id: competitor2.id,
          datetime: start_date_time,
          round: i + 1
        )

        if index.odd? && index != round.length-1
          start_date_time = (start_date_time + 1.day).change(hour: 18, min: 0) 
        else
          start_date_time = start_date_time.change(hour: 20, min: 45) 
        end
      end
    end
  end
  
end

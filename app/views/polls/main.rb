class Character
  attr_reader :name, :offense, :defense
  attr_accessor :hp
  def initialize(name:, hp:, offense:, defense:)
    @name = name
    @hp = hp
    @offense = offense
    @defense = defense
  end
end

class Brave < Character
  def attack(monster)
    puts "#{@name}の攻撃！"
    select_attack = rand(0..4)
    if select_attack == 0
      puts "会心の一撃！"
      damage = (@offense + rand(90..100) - monster.defense) / 2
    else
      puts "通常攻撃"
      damage = (@offense - monster.defense) / 2
    end
    damage = 0 if damage < 0
    monster.hp = monster.hp - damage
    monster.hp = 0 if monster.hp < 0
    if damage == 0
      puts "#{monster.name}は効いていないようだ、、、"
    else
      puts "#{monster.name}へ#{damage}のダメージを与えた！"
    end
  end
end

class Monster < Character
  def attack(brave)
    puts "#{@name}の攻撃！"
    select_attack = rand(0..4)
    if select_attack == 0
      puts "会心の一撃！"
      damage = (@offense + rand(80..100) - brave.defense) / 2
    else
      puts "通常攻撃"
      damage = (@offense - brave.defense) / 2
    end
    damage = 0 if damage < 0
    brave.hp = brave.hp - damage
    brave.hp = 0 if brave.hp < 0
    if damage == 0
      puts "#{brave.name}は効いていない！"
    else
      puts "#{brave.name}は#{damage}のダメージを受けた！"
    end
  end
end


MONSTER_LIST = [
  {name: "スライム", hp: 10, offense: 10, defense: 10},
  {name: "メタルスライム", hp: 20, offense: 19, defense: 32},
  {name: "キングスライム", hp: 120, offense: 50, defense: 50},
  {name: "シドー", hp: 300, offense: 190, defense: 100},
  {name: "ゾーマ", hp: 500, offense: 302, defense: 302}
]

brave = Brave.new(name: "勇者", hp: 910, offense: 290, defense: 190)

monster = Monster.new(MONSTER_LIST.sample)

puts "#{monster.name}があらわれた！"

while brave.hp > 0 && monster.hp > 0
  brave.attack(monster)
  monster.attack(brave) if monster.hp > 0
  puts <<~TEXT
  ==============================
  【#{brave.name}】 HP: #{brave.hp}
  【#{monster.name}】 HP: #{monster.hp}
  ==============================
  TEXT
end

if brave.hp == 0
  puts "#{brave.name}は死んでしまった"
else
  puts "#{monster.name}をやっつけた！"
end

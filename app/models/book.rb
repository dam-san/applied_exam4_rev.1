class Book < ApplicationRecord
	
	# Userを１とした時Nの関係を結ぶための　子供側の宣言
	belongs_to:user

	# バリデーション：カラム名、　値がプレゼンスならOK　
	validates :title, presence: true
	# バリデーション：カラム名、　値がプレゼンスならOｋ、長くても２００文字まで
	validates :body, presence: true, length: {maximum: 200}
end

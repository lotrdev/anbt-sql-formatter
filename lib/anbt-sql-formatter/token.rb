# -*- coding: utf-8 -*-

class AnbtSql
  class TokenConstants

    # 空文字. TAB,CR等も１つの文字列として含む。
    SPACE = :space

    # 記号. " <="のような２つで１つの記号もある。
    SYMBOL = :symbol

    # キーワード. "SELECT", "ORDER"など.
    KEYWORD = :keyword

    # 名前. テーブル名、列名など。
    # ダブルクォーテーションが付く場合がある。
    NAME = :name

    # 値. 数値（整数、実数）、文字列など。
    VALUE = :value

    # コメント. シングルラインコメントとマルチラインコメントがある。
    COMMENT = :comment

    # SQL文の終わり.
    END_OF_SQL = :end_of_sql

    # 解析不可能なトークン. 通常のSQLではありえない。
    UNKNOWN = :unknown

    # Colors
    COLORS = {default: 39, black: 30, red: 31, green: 32, yellow: 33, blue: 34, magenta: 35, cyan: 36,
              light_gray: 37, dark_gray: 90, light_red: 91, light_green: 92, light_yellow: 93,
              light_blue: 94, light_magenta: 95, light_cyan: 96, white: 97}
  end


  ##
  # [_type] type of token
  # [string] string of token
  # [pos] ソース文字列の先頭からのトークンの位置をあらわす。
  #       値は ゼロ(ZERO)オリジン。
  #       デフォルト値 -1 の場合には「位置情報に意味がない」ことをあらわす。
  #
  class AbstractToken
    attr_accessor :_type, :string, :pos, :color

    @_type = nil

    @string = nil

    @color = nil

    @pos = -1

    #
    # このバリューオブジェクトの文字列表現を取得する。
    # 
    # オブジェクトのシャロー範囲でしか to_s されない点に注意。
    # 
    # @return:: バリューオブジェクトの文字列表現。
    #
    def to_s
      @string
    end

    def colored_string
      color.nil? ? string : "\e[#{@color}m#{@string}\e[0m"
    end
  end


  class Token < AbstractToken
    def initialize(type, string, pos=nil, color=nil)
      @_type = type
      @string = string

      @pos = pos || -1
      @color = color
    end
  end
end

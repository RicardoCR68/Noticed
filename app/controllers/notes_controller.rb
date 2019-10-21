class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[edit update destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to main_page_path
    else
      render new
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to main_page_path
    else
      render edit
    end
  end

  def destroy
    @note.destroy
  end

  private


  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description, :due_date, :priority)
  end
end

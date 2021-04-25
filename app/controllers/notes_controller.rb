class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    # GET /notes
    def index
        # @notes = Note.all.sort_by { |n| [n.unique_identifier] }
        @notes = Note.all
    end

    # GET /notes/1
    # def show
    # end

    # GET /notes/new
    def new
        @note = Note.new
    end

    # def new
    #     render layout: false
    # end

    # GET /notes/1/edit
    def edit
    end

    # DELETE /notes/1
    def destroy
        @note.destroy
        redirect_to notes_url, notice: 'Note was successfully destroyed.'
    end

    # POST /notes
    def create
        @note = Note.new(note_params)
        # puts noteToJson note_params
        # puts jsonToNote noteToJson note_params
        if @note.save
            redirect_to :notes, notice: 'Note was created.'
        else
            @recent_note = Note.order("unique_identifier").last
            @notes = Note.all
            render :new
        end
    end

    # def noteToJson note
    #   note.to_json
    # end
    #
    # def jsonToNote json
    #   JSON.parse json
    # end

    # PATCH/PUT /notes/1
    def update
        if @note.update(note_params)
            redirect_to :notes, notice: "Note was updated."
        else
            render :edit, notice: "There was a problem updating note."
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
        def set_note
            @note = Note.find(params[:id]) #unique_identifier
        end

        def note_params
            params.require(:note).permit(:title, :content, :unique_identifier, :tree_id, reference_ids: [])
        end

end

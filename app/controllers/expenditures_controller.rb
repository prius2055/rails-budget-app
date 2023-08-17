class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[show edit update destroy]

  # GET /expenditures or /expenditures.json
  def index
    @expense = Expense.find(params[:expense_id])
    @expenditures = @expense.expenditures
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show; end

  # GET /expenditures/new
  def new
    @expenditure = Expenditure.new
    @expenses = Expense.where(author_id: current_user.id)
  end

  # GET /expenditures/1/edit
  def edit; end

  # POST /expenditures or /expenditures.json
  def create
    @expenditure = Expenditure.new(name: params[:expenditure][:name], amount: params[:expenditure][:amount], author_id: current_user.id)
    
    if params[:expenditure][:expense_ids]
      if save_expenses_and_expenditures
        redirect_to expense_path(params[:expenditure][:expense_ids].first)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to expenditures_expenses_path(params[:expense_id]), alert: 'please select at least one expense category.'
    end
  end

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html { redirect_to expenditure_url(@expenditure), notice: 'Expenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @expenditure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @expenditure.destroy

    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: 'Expenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  

  def save_expenses_and_expenditures
    ActiveRecord::Base.transaction do
      @expenditure.save
      params[:expenditure][:expense_ids].each do |id|
        ExpendituresExpense.create(expenditure_id: @expenditure.id, expense_id: id.to_i)
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_expenditure
    @expenditure = Expenditure.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expenditure_params
    params.require(:expenditure).permit(:name, :amount, :author_id, expense_ids: [])
  end
end
